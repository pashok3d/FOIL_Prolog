candidate_rule(rule(Conseq, Anteced), _ , NegExamples, LastUsed,rule(Conseq, [Expr|Anteced]), RetLastUsed) :-
	build_expr(LastUsed, Expr, RetLastUsed),Expr \= Conseq,
	suitable(rule(Conseq, [Expr|Anteced]), NegExamples).

build_expr(LastUsed,Expr,RetLastUsed) :-
	predicate(Pred, N),
	build_arg_list(N, vars(LastUsed, LastUsed), false, ArgList, RetLastUsed),
	Expr =.. [Pred|ArgList] .

suitable(PartialRule, NegExamples) :-
	member1(NegEx, NegExamples),
	\+covers(PartialRule, NegEx), !.

member1(X,[X|_]).
member1(X,[_|R]):-
    member1(X,R).




