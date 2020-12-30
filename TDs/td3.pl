/* 1/ Definir le prédicat conc arité 3 qui est tel que conc (L,L,LL_) est vrai si LL_ est la concaténation des listes L et L_ */
/* 2/ Definir le prédicat partage arité 3 qui est tel que partage (LL_,L,L_) est vrai si les listes L et L_ sont le résultat du partage sur alternativement L puis L_ de la liste L et LL_
		ex: partage ([1],L,L_) et partage([1,2],L,L_) */
/* 3/ En supposant existence de la definition ( inf_st(X,Y) :- X<Y)
	Definir prédicat place arité 3 qui est tel que place (X,T,TX) est vrai si la liste TX est le résultat de insertion de X selon ordre inf_st dans la liste T deja triée
	Definir le prédicat dpeda arité 5 (pour de part et autre) qui est tel que dpeda (P,L,PPP,EP,PGP) est vrai si PPP (resp EP, PGP) est la liste des elements de la liste L plus petits (resp egaux, plus grands) que P */
/*	Definir le prédicat fusion arité 3 qui est tel que fusion(T,T_,TT_) est vrai si la liste triée TT_ est le resultat de la fusion des listes triée T et T_ */

/*EN déduire :
	- le tri par insertion
	- le tri "quick" par pivot
	- le tri par fusion