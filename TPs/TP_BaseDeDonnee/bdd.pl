%1
%Pour vin1

vin1(100,"Chablis",1974,12).
vin1(110,"Mercurey",1978,13).
vin1(120,"Macon",1977,12).

vin2(100,"Chablis",1974,12).
vin2(200,"Sancerre",1979,11).
vin2(210,"Pouilly",1980,12).
vin2(230,"Pouilly",1981,12).

viticulteurs("Nicolas","Pouilly","Bourgogne").
viticulteurs("Martin","Bordeaux","Bordelais").

vin3(N,C,M,D) :-vin1(N,C,M,D), vin2(N,C,M,D). % le "," est congunction/intersection

% 2 clauses
 /* vin4(N,C,M,D) :-
	vin1(N,C,M,D).
vin4(N,C,M,D) :-
	vin2(N,C,M,D). */

	
% ; => le disjunction/Union	
% 1 seul clause
vin4(N,C,M,D) :-vin1(N,C,M,D);vin2(N,C,M,D). 

%Pour afficher vin4: commande => vin4(N,C,M,D).

%Question 5
not(vin2(_N,_C,1978,_D)).

%Question 6

vin5(N,C,M,D) :-
	vin1(N,C,M,D),
	\+ vin2(N,C,M,D).

% Question 7

vignoble(N,C,M,D,P,V,R) :- 	vin5(N,C,M,D), viticulteurs(P,V,R).

% Question 8

vin6(C,M) :- vin5(_N,C,M,_D).

% Question 9

vin7(N,C,M,D) :- vin4(N,C,M,D), (M<1980,M>1975).

% Question 10

vin8(N,C,M,D,P,V,R) :- vin4(N,C,M,D), viticulteurs(P,V,R), C=V.

%Question 11

vin9(macon, 1977, 12).
vin9(macon, 1979, 14).
vin9(macon, 1980, 12).
vin9(saumur, 1977,  12).
vin9(saumur, 1979,  14).
vin9(chablis, 1977,  12).

type(1977,12).
type(1979,14).

p_v9(C) :- vin9(C,_M,_D).
cru(C) :- p_v9(C), \+ reste(C,_,_).
reste(C,M,D) :- p_v9xtype(C,M,D), \+ vin9(C,M,D).
p_v9xtype(C,M,D) :- p_v9(C), type(M,D).