est_vide(arbre([])).

racine(arbre([X,[sous_arbreg,[sous_arbred]]],X)).

gauche(arbre(_X,sous_arbreg,sous_arbred),sous_arbreg).

droit(arbre(_X,sous_arbreg,sous_arbred),sous_arbred).

inf_st(X,Y) :- X < Y.


nbr_noeud(arbre([]),0).
nbr_noeud(arbre([_X,[sous_arbreg,[sous_arbred]]],N)):-
	nbr_noeud(arbre([sous_arbreg]),NG).
	nbr_noeud(arbre([sous_arbred]),ND).
	N is NG + ND + 1.

%ajoute(X,arbre(Y,sous_arbreg,sous_arbred)) :-
	%inf_st(X,Y), ajoute(X,sous_arbreg).
%ajoute(X,arbre(Y,sous_arbreg,sous_arbred)) :-
	%inf_st(Y,X), ajoute(sous_arbred).
	

%ajouteListe([X|L],arbre(Y,sous_arbreg,sous_arbred),).
