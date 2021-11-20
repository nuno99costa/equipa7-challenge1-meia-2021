% Bibliotecas HTTP
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_client)).
% Bibliotecas JSON
:- use_module(library(http/json_convert)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json)).

:-consult(sp_exp).

:- http_handler('/iotintrusiondetection', get_virus_list, []).

:- json_object l(a:list(name:string, number:float)).

server(Port) :-						
        http_server(http_dispatch, [port(Port)]).

get_virus_list(Request) :-
    http_parameters(Request,
                    [ conn_state(Conn_state, []),
                      duration(Duration, [float]),
                      history(History, [integer]),
                      id_orig_p(Id_orig_p, [integer]),
                      id_resp_p(Id_resp_p, [integer]),
                      missed_bytes(Missed_bytes, [integer]),
                      orig_bytes(Orig_bytes, [integer]),
                      orig_ip_bytes(Orig_ip_bytes, [integer]),
                      orig_pkts(Orig_pkts, [integer]),
                      resp_bytes(Resp_bytes, [integer]),
                      resp_ip_bytes(Resp_ip_bytes, [integer]),
                      resp_pkts(Resp_pkts, [integer]),
                      service(Service, [])
                    ]),

    Val = [
		conn_state(c, Conn_state),
		duration(c, Duration),
		history(c, History),
		id_orig_p(c, Id_orig_p),
		id_resp_p(c, Id_resp_p),
		missed_bytes(c, Missed_bytes),
		orig_bytes(c, Orig_bytes),
		orig_ip_bytes(c, Orig_ip_bytes),
		orig_pkts(c, Orig_pkts),	
		resp_bytes(c, Resp_bytes),
		resp_ip_bytes(c, Resp_ip_bytes),	
		resp_pkts(c, Resp_pkts),
		service(c, Service)
    ],

    asserta(test(Val)),

    run(Val),

    conclusoes(ListVi),
    dict_create(D, _, ListVi),

    reply_json_dict(D).

inicializar_server:-
    server(8081),!,
    inicializar_sistema,!.

:- inicializar_server.