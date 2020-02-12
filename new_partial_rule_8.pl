new_partial_rule(PosExamples, NegExamples, PartialRule, LastUsed,BestRule, RetLastUsed) :-
     findall(NewRuleDescr,scored_rule(PosExamples, NegExamples, PartialRule,LastUsed, NewRuleDescr),Rules),
     choose_best(Rules, BestRule, RetLastUsed).



scored_rule(PosExamples, NegExamples, PartialRule, LastUsed,rule_descr(CandPartialRule, Score, RetLastUsed) ) :-
    candidate_rule(PartialRule, PosExamples, NegExamples, LastUsed,CandPartialRule, RetLastUsed) ,
    filter(PosExamples, CandPartialRule, PosExamples1),
    filter(NegExamples, CandPartialRule, NegExamples1),
    length1(PosExamples1, NPos),
    length1(NegExamples1, NNeg),
    NPos > 0,
    Score is NPos - NNeg.

choose_best( [rule_descr(Rule,_ ,RetLastUsed)],Rule, RetLastUsed).

choose_best( [rule_descr(Rule1,Score1,RetLastUsed1),rule_descr(_,Score2,_)|RestRules], BestRule, RetLastUsed) :-
	Score1 > Score2, !,
	choose_best( [rule_descr(Rule1,Score1,RetLastUsed1)|RestRules], BestRule, RetLastUsed).

choose_best( [rule_descr(_,_,_),rule_descr(Rule2,Score2,RetLastUsed2)|RestRules], BestRule, RetLastUsed) :-
	choose_best( [rule_descr(Rule2,Score2,RetLastUsed2)|RestRules], BestRule, RetLastUsed).




