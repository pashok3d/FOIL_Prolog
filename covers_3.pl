covers(rule(Conseq, Anteced), Example) :-
     match_conseq(Conseq, Example, Bindings),
     match_anteced(Anteced, Bindings, _ ) .

match_conseq(Conseq, Example, BindingsOut) :-
    Conseq =.. [_|ArgList1],
    Example =.. [_|ArgList2],
    match_arg_lists(ArgList1,ArgList2,[],BindingsOut) .

match_anteced([ ], Bindings, Bindings) .

match_anteced([A|RestAnteced], BindingsIn, BindingsOut) :-
    match_expr(A, BindingsIn, Bindings1),
    match_anteced(RestAnteced, Bindings1, BindingsOut) .

match_expr(Expr,BindingsIn,BindingsOut) :-
    known_fact(Fact),
    functor(Expr,Functor,N),
    functor(Fact,Functor,N),
    Expr =.. [_|ArgList1],
    Fact =.. [_|ArgList2],
    match_arg_lists(ArgList1,ArgList2,BindingsIn,BindingsOut) .














