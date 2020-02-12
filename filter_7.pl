filter(Examples, Rule, Examples1) :-
               findall(Example,(member1(Example, Examples), covers(Rule, Example)),Examples1).


