:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).

% URL handlers.
:- http_handler('/iotintrusiondetection', handle_request, []).

% Request handlers.
handle_request(Request) :-
    (retractall(ev(_,_));true),
    get_time(X),  % X = seconds elapsed since the epoch.


    open('./output.txt',write,OS),
    write(OS,Request),
    asserta(d(Request.search)),
    close(OS),  
    construir_evidencias(cc, Request.search),
    
    reply_html_page(
        [title('Hello')],
        [h1('Hello'), p(X)]
    ).

construir_evidencias(Id, Ev):-
    Ev = [conn_state(Id, Ev.conn_state),
        duration(Id, Ev.duration),
        history(Id, Ev.history),
        id_orig_p(Id, Ev.id_orig_p),
        id_resp_p(Id, Ev.id_resp_p),
        missed_bytes(Id, Ev.missed_bytes),
        orig_bytes(Id, Ev.orig_bytes),
        orig_ip_bytes(Id, Ev.orig_ip_bytes),
        orig_pkts(Id, Ev.orig_pkts),
        resp_bytes(Id, Ev.resp_bytes),
        resp_ip_bytes(Id, Ev.resp_ip_bytes),
        resp_pkts(Id, Ev.resp_pkts),
        service(Id, Ev.service)],

    asserta(test(Ev)).


server(Port) :-
    http_server(http_dispatch, [port(Port)]).

:- initialization(server(8000)).


x:- 
    d(Dict), is_dict(Dict).