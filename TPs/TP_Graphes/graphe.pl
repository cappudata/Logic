graphe_vide(graphe([])).

non_graphe(graphe([sommet(a,[b]),sommet(b,[b])])).

sommets(graphe(L),S):- %S est une liste
	sommet_rec(L,S).

sommet_rec([],[]).
sommet_rec([sommet(E,_)|L],[E|S]) :-
	sommet_rec(L,S).

member(X,[X|_]).
member(X,[_|L2]) :-
member(X,L2).

%version 1 : explicite
%successeurs(E,graphe(L),succ):-
	%member(sommet(E,succ),L).


%version 2

%successeurs(E,graphe(L),succ) :- 
	%sommets(graphe(L),S),member(E,S),successeurs_rec(E,L,succ).

%successeurs_rec(E,[sommet(E,succ)|_],succ).
%successeurs_rec(E,[sommet(E_,_)|L],succ) :- 
	%E_\=E, successeurs_rec(E,L,succ).


successeurs(S,graphe([sommet(S,Succ)|_]),Succ).
successeurs(S,graphe([sommet(_,_)|R]),Succ) :-
	successeurs(S,graphe(R),Succ).


predecesseurs(E,graphe(L),Pred):-
	sommets(graphe(L),S),member(E,S),
	predecesseurs_rec(E,L,Pred).


predecesseurs_rec(_E,[],[]).

predecesseurs_rec(E,[sommet(_E,succ)|L],Pred) :-
	\+member(E,succ),    %pq on prend la négation de ce prédicat
	predecesseurs_rec(E,L,Pred).

predecesseurs_rec(E,[sommet(E_,succ)|L],[E_|Pred]) :-
	member(E,succ),
	predecesseurs_rec(E,L,Pred).



ote_sommet(E,graphe(L),graphe(L_)):-
	sommets(graphe(L),S),member(E,S),ote_sommet_rec(E,L,L_).

ote_sommet_rec(_E,[],[]).

ote_sommet_rec(E,[sommet(E,_)|L],L_) :- 
	ote_sommet_rec(E,L,L_).

ote_sommet_rec(E,[sommet(E_,succ)|L],[sommet(E_,succ)|L_]) :-
	\+member(E,succ), ote_sommet_rec(E,L,L_).

ote_sommet_rec(E,[sommet(E_,succ)|L],[sommet(E_,succ_)|L_]):-
	member(E,succ),ote(succ,E,succ_), ote_sommet_rec(E,L,L_).

ote([X|L],X,L).
ote([Y|L],X,[Y|L_]) :-
	Y\= X, ote(L,X,L_).



tri_tologique(G,[]) :-
	graphe_vide(G).
tri_tologique(G,O) :-
	\+ graphe_vide(G),
		predecesseurs(S,G,[]),
		ote_sommet(S,G,G_),
		tri_tologique(G_,O_),
		O = [S|O_].




%teste
/*non_graphe(G),graphe_vide(G).
non_graphe(G),sommets(G,S).
successeurs(3,graphe([ sommet(1,[2,3]), sommet(2,[1,3]), sommet(3,[]) ]),[]).
graphe_vide(graphe([ sommet(1,[2,3]), sommet(2,[3]), sommet(3,[]) ])).
sommets(graphe([ sommet(1,[2,3]), sommet(2,[3]), sommet(3,[]) ]),[1,2,3]).
*/


