et(0,0,0).
et(0,1,0).
et(1,0,0).
et(1,1,1).
ou(0,0,0).
ou(0,1,1).
ou(1,0,1).
ou(1,1,1).
non(1,0).
non(0,1).

circuit(A,B,C,H) :-
et(A,B,D), ou(C,B,E), non(D,F), non(E,G), ou(F,G,H).

liste([]).
liste([_X|L]) :-
liste(L).

dernier(X,[X | []], []).
%dernier(X,[Y[ X| [] ]], [Y|[]]).

dernier(X, [Y|L], [Y|L_]) :-
dernier(X,L,L_).


%TD2

%Question 1
rang_pair([],[]).
rang_pair([_],[]).
rang_pair([_X,Y|L1],[Y|L2]) :- %pour que je peux faire cette ligne là il faut que je fasse la ligne suivant
rang_pair(L1,L2).

%Qustion 2

%membre ([X,[X]]). % equale [X] = [X|[]] match avec le 2eme cas
membre(X,[X|_]).
membre(X,[_|L2]) :-
membre(X,L2).

%Question 3

%insertion([],X,[X|_]).

insertion(L1,X,[X|L1]).
insertion([Y|L1],X,[Y|L2]) :-
insertion(L1,X,L2).

%Question 4

prefixe([],_L).  
prefixe([X|L],[X|LL_]) :-
prefixe(L,LL_).

%Question 5

suffixe(L,L).
suffixe(L_,[_|LL_]) :-
suffixe(L_,LL_).

%Question 6

%permute([],[]).
%permute([X|L],) :-   %use insertion
%permute(L,P). 


%TD3

conc([],[],[]).
conc([],L_,L_).
conc([X|L],L_,[X|LL_]) :-
conc(L,L_,LL_).


partage([],[],[]).
partage([X],[X],[]).
partage([X,Y|LL_],[X|L],[Y|L_]) :-
partage(LL_,L,L_).


inf_st(X,Y) :- X<Y.

place(X,[],[X]).
place(X,[Y|T],[X,Y|T]) :-   		% X<Y
	inf_st(X,Y).
place(X,[X|T],[X,X|T]). 	% X=Y
place(X,[Y|T],[Y|TX]) :-    %Y<X
	inf_st(Y,X), place(X,T,TX).


dpeda(_P,[],[],[],[]).
dpeda(P,[X|L],[X|PPP],EP,PGP) :-
	inf_st(X,P), dpeda(P,L,PPP,EP,PGP).
dpeda(P,[P|L],PPP,[P|EP],[PGP]):-
	dpeda(P,L,PPP,EP,PGP).
dpeda(P,[X|L],PPP,EP,[X|PGP]) :-
	inf_st(P,X), dpeda(P,L,PPP,EP,PGP).


fusion([],[],[]).
fusion([],L,L).
fusion(L,[],L) :- L=[_|_].

fusion([X|T],[Y|T_],[X|YTT_]):- 
	inf_st(X,Y), fusion(T,[Y|T_],YTT_).
fusion([X|T],[X|T_],[X,X|TT_]) :-
	fusion(T,T_,TT_).
fusion([X|T],[Y|T_],[Y|XTT_]) :-
	inf_st(Y,X), fusion([X|T],T_,XTT_).


renverser(L,R):-
	renverser_(L,[],R).

renverser_([],Acc,Acc).
renverser_([X|L],Acc,R):-
	renverser_(L,[X|Acc],R).