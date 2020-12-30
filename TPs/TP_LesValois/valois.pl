homme("Henri II").
homme("Henri III").
homme("Charles IX").
homme("Henri III").
homme("Margot").
homme("Charles Emmanuel").
homme("Victor-Amedee").

femme("Francois 1er").
femme("Madeleine").
femme("Marguerite").
femme("Elisabeth").


parent("Francois 1er","Henri II").
parent("Francois 1er","Madeleine").
parent("Francois 1er","Marguerite").

parent("Henri II","Francois II").
parent("Henri II","Charles IX").
parent("Henri II","Henri III").
parent("Henri II","Margot").

parent("Charles IX","Elisabeth").
parent("Marguerite","Charles Emmanuel").
parent("Charles Emmanuel","Victor-Amedee").

pere(X,Y) :-
	parent(X,Y),
	homme(X).

mere(X,Y) :-
	parent(X,Y),
	femme(X).

fille(X,Y) :-
	parent(Y,X),
	femme(X).

gdparent(X,Y) :-
	parent(X,Z),
	parent(Z,Y).

gdpere(X,Y) :-
	gdparent(X,Y),
	homme(X).

ancetre(X,Y) :-
	parent(X,Y).

ancetre(X,Y) :-
	parent(X,Z),
	ancetre(Z,Y).

fere(X,Y) :-
	parent(Z,X),
	parent(Z,Y),
	homme(X),
	\+ (X=Y). %X\=Y

