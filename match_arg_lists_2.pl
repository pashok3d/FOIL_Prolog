 match_args(Arg1,Arg2,[], [b(Arg1, Arg2)]).

% Arg1=var, Arg2=val
 match_args(Var,Val,[b(Var,Val)|RestBindingsIn],[b(Var,Val)|RestBindingsIn]).

% Arg1\=var Arg2\=val
 match_args(Arg1,Arg2,[b(Var,Val)|RestBindingsIn], [b(Var,Val)|RestBindings1]):-
    Arg1\=Var,
    Arg2\=Val,
    match_args(Arg1,Arg2, RestBindingsIn, RestBindings1).

match_arg_lists([], [], NewBindings, NewBindings).

match_arg_lists([Arg1 | Rest1], [Arg2 | Rest2], Bindings, BindingsOut) :-
	match_args(Arg1, Arg2, Bindings, Bindings1),
	match_arg_lists(Rest1, Rest2, Bindings1, BindingsOut).

