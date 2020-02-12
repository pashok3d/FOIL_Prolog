learn_one_rule( _ , [ ] , Rule, _ , Rule).

learn_one_rule(PosExamples, NegExamples, PartialRule, LastUsed, Rule ) :-
  new_partial_rule(PosExamples, NegExamples,PartialRule, LastUsed,NewPartialRule, NewLastUsed),
  filter(PosExamples, NewPartialRule, PosExamples1),
  filter(NegExamples, NewPartialRule, NegExamples1),
  learn_one_rule(PosExamples1, NegExamples1, NewPartialRule,NewLastUsed, Rule ) .
