
%G = graphe([sommet(a,[b]),sommet(b,[e,c,f]),sommet(c,[d,g]),sommet(d,[c,h]),sommet(e,[a,f]),sommet(f,[g]),sommet(g,[f]),sommet(h,[d,g])]).

%chemin(a,g,graphe([sommet(a,[b]),sommet(b,[e,c,f]),sommet(c,[d,g]),sommet(d,[c,h]),sommet(e,[a,f]),sommet(f,[g]),sommet(g,[f]),sommet(h,[d,g])]),[a,b,e,f,g]).


%chemin(1,5,graphe([sommet(1,[2]),sommet(2,[1,3,4]), sommet(3,[5]), sommet(4,[]), sommet(5,[])]),[1,2,3,5]).
%successeurs(2,graphe([sommet(1,[2]),sommet(2,[1,3,4]), sommet(3,[5]), sommet(4,[]), sommet(5,[])]),Succ).


graphe_vide(graphe([])).
non_graphe(graphe([sommet(a,[b]),sommet(b,[b])])).

sommets(graphe(L),S):- %S est une liste
	sommet_rec(L,S).

sommet_rec([],[]).
sommet_rec([sommet(E,_)|L],[E|S]) :-
	sommet_rec(L,S).

membre(X,[X|_]).
membre(X,[_|L2]) :-
membre(X,L2).

successeurs(S,graphe([sommet(S,Succ)|_]),Succ).
successeurs(S,graphe([sommet(_,_)|R]),Succ) :-
	successeurs(S,graphe(R),Succ).




%Commence par le sommet U, regarde ses succs. prend un et commence par ce sommet
% je suis bloqué par cet étape. je ne sais pas comment faire pour la récursivité à partir un succ 
%on a essayé mais on arrive pas


chemin(U,V,graphe(L),C) :-
	sommets(graphe(L),S), membre(U,S), membre(V,S), chemin_rec(U,V,graphe(L),[],C).

chemin_rec(U,V,graphe([]),C,C).

chemin_rec(U,V,graphe([sommet(U,[X|Succ])|R]),Acc,C).
	\+ membre(X,Acc), 




/*
chemin(U,V,graphe([sommet(V,_)|_]),C).

chemin(U,V,graphe([sommet(X,(B,L|succ))|R]),[X|C]) :-
	membre(B,C), chemin(U,V,([sommet(X,L|succ)|R]),C).
*/