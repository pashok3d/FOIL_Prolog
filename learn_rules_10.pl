learn_rules([ ] , _ , _ , _ , [ ]) .

learn_rules(PosExamples, NegExamples, Conseq, VarsIndex, [Rule | RestRules])  :-
	learn_one_rule(PosExamples, NegExamples, rule(Conseq, [ ]), VarsIndex, Rule ) ,
	remove(PosExamples, Rule, RestPosExamples),
	learn_rules(RestPosExamples, NegExamples, Conseq, VarsIndex, RestRules) .

remove([ ],_ ,[ ]).

remove([Example|Rest], Rule, Rest1) :-
	covers(Rule, Example), ! ,
	remove(Rest, Rule, Rest1).

remove([Example|Rest], Rule, [Example|Rest1]) :-
	remove(Rest, Rule, Rest1).
