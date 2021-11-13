% Versao preparada para lidar com regras que contenham negacao (nao)
% Metaconhecimento
% Explicacoes como?(how?) e porque nao?(whynot?)

:-op(220,xfx,entao).
:-op(35,xfy,se).
:-op(240,fx,regra).
:-op(500,fy,nao).
:-op(600,xfy,e).

:-dynamic justifica/3.
:-dynamic ultimo_facto/1.
:-dynamic ultima_regra/1.
:-dynamic facto/2.
:-dynamic facto_dispara_regras/2.
:-dynamic valores/1.

:-include('1-hideandseek.txt').
:-include('9-hajime.txt').
:-include('17-kenjiro.txt').
:-include('20-torii.txt'). 
:-include('21-torii.txt').
:-include('33-kenjiro.txt').
:-include('34-mirai.txt').
:-include('35-mirai.txt').
:-include('39-ircbot.txt').
:-include('42-trojan.txt').
:-include('43-mirai.txt').
:-include('48-mirai.txt').
:-include('49-mirai.txt').
:-include('60-gagfyt.txt').

bases_conhecimento([
		'1-hideandseek.txt',
		'9-hajime.txt',
		'17-kenjiro.txt',
		'20-torii.txt',
		'21-torii.txt',
		'33-kenjiro.txt',
		'34-mirai.txt',
		'35-mirai.txt',
		'39-ircbot.txt',
		'42-trojan.txt',
		'43-mirai.txt',
		'48-mirai.txt',
		'49-mirai.txt',
		'60-gagfyt.txt'
	]).

evidencias([
		orig_pkts(_,_),
		resp_pkts(_,_),
		conn_state(_,_),
		history(_,_),
		missed_bytes(_,_),
		duration(_,_),
		id_resp_p(_,_),
		service(_,_),
		orig_ip_bytes(_,_),
		id_orig_p(_,_),
		orig_bytes(_,_),
		resp_bytes(_,_),
		resp_ip_bytes(_,_)
	]).

hipoteses([
	% 1
	hipotese(_,orig_pkts_le11),
	hipotese(_,orig_pkts_le11_resp_pkts_le2),
	hipotese(_,orig_pkts_le11_resp_pkts_le2_conn_state_niS2),

	% 9
	hipotese(_,resp_pkts_le33),
	hipotese(_,resp_pkts_le33_resp_pkts_g3),
	hipotese(_,resp_pkts_le3),

	% 17
	hipotese(_,id_resp_p_le45042),
	hipotese(_,id_resp_p_le45042_service_inhttp),
	hipotese(_,id_resp_p_le45042_service_nihttp),
	hipotese(_,id_resp_p_le45042_service_nihttp_orig_pkts_le30),
	hipotese(_,id_resp_p_le45042_service_nihttp_orig_pkts_le30_orig_ip_bytes_g348),
	
	% 20
	hipotese(_, conn_state_niS2),
	
	% 21
	hipotese(_, orig_bytes_g7975),
	hipotese(_, orig_bytes_g7975_history_le5),

	% 33
	hipotese(_,id_resp_p_g22648),
	hipotese(_,id_resp_p_g22648_id_orig_p_g39624),
	hipotese(_,id_resp_p_le8080_id_resp_p_g101),
	hipotese(_,id_resp_p_le101),
	hipotese(_,id_resp_p_le8080_id_resp_p_g101_orig_pkts_le4),

	% 34
	hipotese(_, id_resp_p_g3461),
	hipotese(_, id_resp_p_g3461_resp_ip_bytes_g63),
	
	% 35
	hipotese(_,history_g9),
	hipotese(_,history_le9),
	hipotese(_,history_le9_id_resp_p_g66),
	
	% 39
	hipotese(_,orig_bytes_g94),
	hipotese(_,orig_bytes_g94_orig_bytes_le114),

	% 42
	hipotese(_,missed_bytes_g730),
	hipotese(_,missed_bytes_le730),
	
	% 43
	hipotese(_, id_orig_p_g30647),
	hipotese(_, id_orig_p_le30647),
	hipotese(_, id_orig_p_g30647_duration_g3),
	hipotese(_, id_orig_p_g30647_duration_le3),
	hipotese(_, id_orig_p_g30647_duration_le3_conn_state_iRSTO_S0),
	hipotese(_, id_orig_p_g30647_duration_le3_conn_state_niRSTO_S0),
	hipotese(_, id_orig_p_g30647_duration_le3_conn_state_iRSTO_S0_orig_bytes_le19),
	hipotese(_, id_orig_p_g30647_duration_le3_conn_state_niRSTO_S0_duration_g1),
	hipotese(_, id_orig_p_g30647_duration_le3_conn_state_niRSTO_S0_duration_le1),

	% 48
	hipotese(_,resp_pkts_le304),
	hipotese(_,resp_pkts_le304_resp_bytes_g82355),
	
	% 49
	hipotese(_, resp_bytes_g60382),
	hipotese(_, resp_bytes_g60382_resp_bytes_le179176),
	hipotese(_, resp_bytes_g60382_resp_bytes_le179176_resp_bytes_g132319),
	
	% 60
	hipotese(_, orig_ip_bytes_le390632233),
	hipotese(_, orig_ip_bytes_g390632233),
	hipotese(_, orig_ip_bytes_le390632233_orig_ip_bytes_g125909890),
	hipotese(_, orig_ip_bytes_le390632233_orig_ip_bytes_le125909890),
	hipotese(_, orig_ip_bytes_g390632233_orig_pkts_le125909890),
	hipotese(_, orig_ip_bytes_g390632233_orig_pkts_g125909890),
	hipotese(_, orig_ip_bytes_le390632233_orig_ip_bytes_le125909890_id_resp_p_g55610)
]).

virus([
		('Hide and Seek', hide_and_seek),
		('Trojan', trojan),
		('Hajime', hajime),
		('Kenjiro', kenjiro),
		('Torii', torii),
		('IRCBot', ircbot),
		('Mirai', mirai),
		('Gagfyt', gagfyt)
	]).

valores([
		conn_state(c,'S1'),
		duration(c,4),
		history(c,4),
		id_orig_p(c,3332233),
		id_resp_p(c,3),
		missed_bytes(c,6666),
		orig_bytes(c,150),
		orig_ip_bytes(c,42222222222),
		orig_pkts(c,12312312312),	
		resp_bytes(c,1800),
		resp_ip_bytes(c,64),	
		resp_pkts(c,2422),
		service(c,'http')
	]).

run:-
	limpar_bc, inserir_evidencias,		% Codigo temporario para testes
	ultimo_facto,
	gera_metaconhecimento,
	arranca_motor.

carrega_bc:-
		%write('NOME DA BASE DE CONHECIMENTO (terminar com .)-> '),
		%read(NBC),
		bases_conhecimento(NBCs),
		carrega_bc(NBCs),
		% ultima_regra, 

		ultimo_facto,
		gera_metaconhecimento.
		

carrega_bc([]):-nl.
carrega_bc([NBC|NBCs]):-
		consult(NBC),
		write(' -- Consulted '),write(NBC),write(' --'),nl,
		carrega_bc(NBCs).

arranca_motor:-arranca_motor(0),!.

arranca_motor(N):-ultimo_facto(N),!.
arranca_motor(N):-N1 is N+1, facto(N1,Facto),
		facto_dispara_regras1(Facto, LRegras),
		dispara_regras(N, Facto, LRegras),
		arranca_motor(N1).

facto_dispara_regras1(Facto, LRegras):-
	facto_dispara_regras(Facto, LRegras),
	!.
facto_dispara_regras1(_, []).
% Caso em que o facto nao origina o disparo de qualquer regra.

dispara_regras(N, Facto, [ID|LRegras]):-
	regra ID se LHS entao RHS,
	facto_esta_numa_condicao(Facto,LHS),
	% Instancia Facto em LHS
	verifica_condicoes(LHS, LFactos),

	% Acho que ja nao e necessario - Jose
	%member(N,LFactos),
	concluir(RHS,ID,LFactos),
	!,
	dispara_regras(N, Facto, LRegras).

dispara_regras(N, Facto, [_|LRegras]):-
	dispara_regras(N, Facto, LRegras).

dispara_regras(_, _, []).

% Novo predicado - Jose
facto_esta_numa_condicao(F,[nao F1]):- facto_esta_numa_condicao(F, [F1]).

facto_esta_numa_condicao(F,[F  e _]).

facto_esta_numa_condicao(F,[avalia(F1)  e _]):- F=..[H,H1|_],F1=..[H,H1|_].

facto_esta_numa_condicao(F,[membro(F1)  e _]):- F=..[H,H1|_],F1=..[H,H1|_].

facto_esta_numa_condicao(F,[_ e Fs]):- facto_esta_numa_condicao(F,[Fs]).

facto_esta_numa_condicao(F,[F]).

facto_esta_numa_condicao(F,[avalia(F1)]):-F=..[H,H1|_],F1=..[H,H1|_].

facto_esta_numa_condicao(F,[membro(F1)]):-F=..[H,H1|_],F1=..[H,H1|_].


verifica_condicoes([nao avalia(X) e Y],[nao X|LF]):- !,
	\+ avalia(_,X),
	verifica_condicoes([Y],LF).
verifica_condicoes([avalia(X) e Y],[N|LF]):- !,
	avalia(N,X),
	verifica_condicoes([Y],LF).

% Novos predicados - Jose
verifica_condicoes([membro(X) e Y],[N|LF]):- !,
	membro(N,X),
	verifica_condicoes([Y],LF).
verifica_condicoes([nao membro(X) e Y],[N|LF]):- !,
	\+ membro(N,X),
	verifica_condicoes([Y],LF).

verifica_condicoes([nao avalia(X)],[nao X]):- !, \+ avalia(_,X).
verifica_condicoes([avalia(X)],[N]):- !, avalia(N,X).

% Novos predicados - Jose
verifica_condicoes([nao membro(X)],[nao X]):- !, \+ membro(_,X).
verifica_condicoes([membro(X)],[N]):- !, membro(N,X).

verifica_condicoes([nao X e Y],[nao X|LF]):- !,
	\+ facto(_,X),
	verifica_condicoes([Y],LF).
verifica_condicoes([X e Y],[N|LF]):- !,
	facto(N,X),
	verifica_condicoes([Y],LF).

verifica_condicoes([nao X],[nao X]):- !, \+ facto(_,X).
verifica_condicoes([X],[N]):- facto(N,X).


concluir([cria_facto(F)|Y],ID,LFactos):-
	!,
	cria_facto(F,ID,LFactos),
	concluir(Y,ID,LFactos).

concluir([],_,_):-!.


cria_facto(F,_,_):-
	facto(_,F),!.

cria_facto(F,ID,LFactos):-
	retract(ultimo_facto(N1)),
	N is N1+1,
	asserta(ultimo_facto(N)),
	assertz(justifica(N,ID,LFactos)),
	assertz(facto(N,F)),
	write('Foi concluido o facto n '),write(N),write(' -> '),write(F),nl,!.%get0(_),!.

% Novo predicado - Jose
membro(N,P):-	P=..[Functor,Entidade,Valores],
		P1=..[Functor,Entidade,Valor],
		facto(N,P1),
		member(Valor,Valores).

avalia(N,P):-	P=..[Functor,Entidade,Operando,Valor],
		P1=..[Functor,Entidade,Valor1],
		facto(N,P1),
		compara(Valor1,Operando,Valor).

compara(V1,==,V):- V1==V.
compara(V1,\==,V):- V1\==V.
compara(V1,>,V):-V1>V.
compara(V1,<,V):-V1<V.
compara(V1,>=,V):-V1>=V.
compara(V1,=<,V):-V1=<V.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Visualizacao da base de factos

factos:-
		findall(N, facto(N, _), LFactos),
		escreve_factos(LFactos).

regras:-
		findall(regra ID se LHS entao RHS, regra ID se LHS entao RHS, Rs),
		write_each(Rs).

metaconhecimento:-
		findall((F,R), facto_dispara_regras(F,R),L),
		write_each(L).

write_each([]).
write_each([E|Es]):-writeln(E),write_each(Es).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Geracao de explicacoes do tipo "Como"

como(N):-ultimo_facto(Last),Last<N,!,
	write('Essa conclusao noo foi tirada'),nl,nl.
como(N):-justifica(N,ID,LFactos),!,
	facto(N,F),
	write('Conclui o facto n '),write(N),write(' -> '),write(F),nl,
	write('pela regra '),write(ID),nl,
	write('por se ter verificado que:'),nl,
	escreve_factos(LFactos),
	write('********************************************************'),nl,
	explica(LFactos).
como(N):-facto(N,F),
	write('O facto n '),write(N),write(' -> '),write(F),nl,
	write('foi conhecido inicialmente'),nl,
	write('********************************************************'),nl.

escreve_factos([I|R]):-facto(I,F), !,
	write('O facto n '),write(I),write(' -> '),write(F),write(' e verdadeiro'),nl,
	escreve_factos(R).
escreve_factos([I|R]):-
	write('A condicao '),write(I),write(' e verdadeira'),nl,
	escreve_factos(R).
escreve_factos([]).

explica([I|R]):- \+ integer(I),!,explica(R).
explica([I|R]):-como(I),
		explica(R).
explica([]):-	write('********************************************************'),nl.




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Geracao de explicacoes do tipo "Porque nao"
% Exemplo: ?- whynot(classe(meu_veiculo,ligeiro)).

whynot(Facto):-
	whynot(Facto,1).

whynot(Facto,_):-
	facto(_, Facto),
	!,
	write('O facto '),write(Facto),write(' nao e falso!'),nl.
whynot(Facto,Nivel):-
	encontra_regras_whynot(Facto,LLPF),
	whynot1(LLPF,Nivel).
whynot(nao Facto,Nivel):-
	formata(Nivel),write('Porque:'),write(' O facto '),write(Facto),
	write(' e verdadeiro'),nl.
whynot(Facto,Nivel):-
	formata(Nivel),write('Porque:'),write(' O facto '),write(Facto),
	write(' nao esta definido na base de conhecimento'),nl.

%  As explicacoes do whynot(Facto) devem considerar todas as regras que poderiam dar origem a conclusao relativa ao facto Facto

encontra_regras_whynot(Facto,LLPF):-
	findall((ID,LPF),
		(
		regra ID se LHS entao RHS,
		member(cria_facto(Facto),RHS),
		encontra_premissas_falsas(LHS,LPF),
		LPF \== []
		),
		LLPF).

whynot1([],_).
whynot1([(ID,LPF)|LLPF],Nivel):-
	formata(Nivel),write('Porque pela regra '),write(ID),write(':'),nl,
	Nivel1 is Nivel+1,
	explica_porque_nao(LPF,Nivel1),
	whynot1(LLPF,Nivel).

encontra_premissas_falsas([nao X e Y], LPF):-
	verifica_condicoes([nao X], _),
	!,
	encontra_premissas_falsas([Y], LPF).
encontra_premissas_falsas([X e Y], LPF):-
	verifica_condicoes([X], _),
	!,
	encontra_premissas_falsas([Y], LPF).
encontra_premissas_falsas([nao X], []):-
	verifica_condicoes([nao X], _),
	!.
encontra_premissas_falsas([X], []):-
	verifica_condicoes([X], _),
	!.
encontra_premissas_falsas([nao X e Y], [nao X|LPF]):-
	!,
	encontra_premissas_falsas([Y], LPF).
encontra_premissas_falsas([X e Y], [X|LPF]):-
	!,
	encontra_premissas_falsas([Y], LPF).
encontra_premissas_falsas([nao X], [nao X]):-!.
encontra_premissas_falsas([X], [X]).
encontra_premissas_falsas([]).

explica_porque_nao([],_).
explica_porque_nao([nao avalia(X)|LPF],Nivel):-
	!,
	formata(Nivel),write('A condicao nao '),write(X),write(' e falsa'),nl,
	explica_porque_nao(LPF,Nivel).
explica_porque_nao([avalia(X)|LPF],Nivel):-
	!,
	formata(Nivel),write('A condicao '),write(X),write(' e falsa'),nl,
	explica_porque_nao(LPF,Nivel).
explica_porque_nao([P|LPF],Nivel):-
	formata(Nivel),write('A premissa '),write(P),write(' e falsa'),nl,
	Nivel1 is Nivel+1,
	whynot(P,Nivel1),
	explica_porque_nao(LPF,Nivel).

formata(Nivel):-
	Esp is (Nivel-1)*5, tab(Esp).


retirar_facto(K) :-
	retract(facto(K,_)),
	findall(K1,(justifica(K1,_,L),member(K,L)),LK1),retirar_lista_factos(LK1).
	retirar_lista_factos([ ]).
	retirar_lista_factos([K1|LK1]):-
	retract(justifica(K1,_,_)),retirar_facto(K1),retirar_lista_factos(LK1).

ultimo_facto:-
	(retract(ultimo_facto(_)),!;true),
	findall(N, facto(N,_), Ns),
	max_list(Ns, MN),
	asserta(ultimo_facto(MN)).

ultima_regra:-
	(retract(ultima_regra(_)),!;true),
	findall(N, regra N se _ entao _ , Ns),
	max_list(Ns, MN),
	asserta(ultima_regra(MN)).

gera_metaconhecimento:-
	retractall(facto_dispara_regras(_,_)),	
	evidencias(E),hipoteses(H),
	append(E,H,L),
	gera_metaconhecimento(L).

gera_metaconhecimento([]).
gera_metaconhecimento([F|LF]):-gera_metaconhecimento1(F),
	gera_metaconhecimento(LF).
gera_metaconhecimento1(F):-
	findall(ID,(regra ID se LHS entao _, facto_esta_numa_condicao(F,LHS)),LID),
	((LID==[ ],!);assertz(facto_dispara_regras(F,LID))).

%% Limpar

limpar_bc:-
		retractall(justifica(_,_,_)),
		retractall(facto(_,_)).

inserir_evidencias:-
		valores(Es),
		inserir_evidencia(1,Es).

inserir_evidencia(_, []):-!.
inserir_evidencia(N, [E|Es]):-
		assertz(facto(N, E)),
		N1 is N+1,
		inserir_evidencia(N1, Es).

% Predicato temporario
conclusoes:-
		conclusoes(c).
conclusoes(Con):-
		virus(Vs),
		write(' -- Conexao '),write(Con),write(' --'),nl,
		conclusoes1(Con,Vs).
		
conclusoes1(_, []):-!.
conclusoes1(Con, [(Name, Id)|Vs]):-
		probabilidade(Con,Id,P),
		write('	  Probabilidade do virus '),write(Name),write(': '),writeln(P),
		conclusoes1(Con, Vs).

probabilidade(Con, Id, P):-
		F =.. [Id,Con,N],
		findall(N, facto(_,F), Ns), max_list(Ns, P),!.
probabilidade(_, _, 0.00).
	
