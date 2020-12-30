liste([]).
liste([_X|L]) :-
liste(L).

liste_meme_longeur([],[]).
liste_meme_longeur([_|L],[_|L_]) :-
	liste_meme_longeur(L,L_).

membre(X,[X|_L]).
membre(X,[_Y|L]) :-
	membre(X,L).

prefixe([],_L).
prefixe([X|L1],[X|L2]) :-
	prefixe(L1,L2).

suffixe(L1,L1).
suffixe(L1,[_X|L2]) :-
	suffixe(L1,L2).


sous_liste(L1,L2) :-
	prefixe(L1,L2).
sous_liste(L1,[_X|L2]) :-
	sous_liste(L1,L2).


renverser(L,R) :-
	renverser_(L,[],R).

renverser_([],Acc,Acc).
renverser_([X|L],Acc,R):-
	renverser_(L,[X|Acc],R).


insertion(L1,X,[X|L1]).
insertion([Y|L1],X,[Y|L2]):-
	insertion(L1,X,L2).


concatenation([],[],[]).
concatenation([],L_,L_).
concatenation([X|L],L_,[X|LL_]) :-
concatenation(L,L_,LL_).


partage([],L_,L_).
partage([X],[X],[]).
partage([X,Y|LL_],[X|L_],[Y|L]) :-
	partage(LL_,L_,L).

inf_st(X,Y) :- X<Y.

place(X,[],[X]).
place(X,[Y|T],[X,Y|T]) :-   		% X<Y
	inf_st(X,Y).
place(X,[X|T],[X,X|T]). 	% X=Y
place(X,[Y|T],[Y|TX]) :-    %Y<X
	inf_st(Y,X), place(X,T,TX).

