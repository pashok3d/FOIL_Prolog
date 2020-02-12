known_fact(grandfather(a, b)).
known_fact(grandfather(e, g)).
known_fact(father(a, c)).
known_fact(father(c, b)).
known_fact(father(e, m)).
known_fact(mother(m, g)).
predicate(grandfather, 2).
predicate(father, 2).
predicate(mother, 2).

variables([x,y,z,x1,y1,z1]).
elements([a, b, e, g, c, m, t, r]).

length1([ ], 0).
length1([X|Rest], N) :-
	length(Rest, NRest) ,
	N is NRest + 1 .

