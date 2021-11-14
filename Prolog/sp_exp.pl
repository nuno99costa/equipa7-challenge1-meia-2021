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
:-include('3-muhstik.txt'). 
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
:-include('52-mirai.txt').
:-include('60-gagfyt.txt').

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

virus([
		('Hide and Seek', hide_and_seek),
		('Trojan', trojan),
		('Hajime', hajime),
		('Kenjiro', kenjiro),
		('Torii', torii),
		('IRCBot', ircbot),
		('Mirai', mirai),
		('Muhstik', muhstik),
		('Gagfyt', gagfyt)
	]).

valores([
		conn_state(c,'RST1O'),
		duration(c,4.2),
		history(c,5),
		id_orig_p(c,1),
		id_resp_p(c,50000),
		missed_bytes(c,3),
		orig_bytes(c,1),
		orig_ip_bytes(c,150000000222),
		orig_pkts(c,82),	
		resp_bytes(c,1),
		resp_ip_bytes(c,3),	
		resp_pkts(c,1),
		service(c,'dnas'),

		conn_state(d,'S0'),
		duration(d,0.5),
		history(d,4),
		id_orig_p(d,123),
		id_resp_p(d,311),
		missed_bytes(d,23),
		orig_bytes(d,4),
		orig_ip_bytes(d,55),
		orig_pkts(d,12),	
		resp_bytes(d,51),
		resp_ip_bytes(d,1),	
		resp_pkts(d,4),
		service(d,'dns') 
	]).

run:-
	limpar_bc, inserir_evidencias,		% Codigo temporario para testes
	ultimo_facto,
	gera_metaconhecimento,
	arranca_motor.

carrega_bc:-
		%write('NOME DA BASE DE CONHECIMENTO (terminar com .)-> '),
		%read(NBC),
		%bases_conhecimento(NBCs),
		%carrega_bc(NBCs),
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
	evidencias(E),
	gera_metaconhecimento(E).

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

conclusoes:-
		cons(L),
		conclusoes(L).

conclusoes([]).
conclusoes([C|Cs]):-
		virus(Vs),
		write(' -- Conexao '),write(C),write(' --'),nl,
		conclusoes1(C,Vs),
		conclusoes(Cs).
		
conclusoes1(_, []):-!.
conclusoes1(Con, [(Name, Id)|Vs]):-
		probabilidade(Con,Id,P),
		write('	  Probabilidade do virus '),write(Name),write(': '),writeln(P),
		conclusoes1(Con, Vs).

probabilidade(Con, Id, P):-
		F =.. [Id,Con,N],
		findall(N, facto(_,F), Ns), max_list(Ns, P),!.
probabilidade(_, _, 0.00).
	
cons(L):-
		valores(V),
		cons1(V,L1),
		list_to_set(L1,L).

cons1([],[]).
cons1([V|Vs],[C|Cs]):-
		V =.. [_,C,_],
		cons1(Vs,Cs).