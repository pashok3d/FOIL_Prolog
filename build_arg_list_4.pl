choose_var_index(Cur,Max,Cur) :-
    Cur =< Max.

choose_var_index(Cur,Max,Next) :-
    Cur < Max,
    IncCur is Cur+1,
    choose_var_index(IncCur,Max,Next).

take_var(1, [X|_], X).
take_var(N,[_|Rest], Var) :- N > 1, NewIndex is N-1, take_var(NewIndex, Rest, Var).

insert_arg(LastUsed, LastLocal, _, Arg, LastLocal, 1) :-
    variables(V),choose_var_index(1,LastUsed,Index), take_var(Index,V,Arg).

insert_arg(LastUsed, LastLocal, FlagIn, Arg, LastLocal, FlagIn) :-
    variables(V), IncLastUsed is LastUsed+1, choose_var_index(IncLastUsed,LastLocal,Index), take_var(Index,V,Arg).

insert_arg(_, LastLocal, FlagIn, Arg, IncLastLocal, FlagIn) :-
    variables(V), IncLastLocal is LastLocal+1, take_var(IncLastLocal,V,Arg).

build_arg_list(N, vars(LastUsed, LastLocal), Flag, [X|Rest], RetLastUsed) :-
    N>1,
    insert_arg(LastUsed, LastLocal, Flag, X, RetLastLocal, FlagOut), DecN is N-1,
    build_arg_list(DecN, vars(LastUsed, RetLastLocal), FlagOut, Rest, RetLastUsed).

build_arg_list(1, vars(LastUsed, LastLocal), 0, [X|[]], LastLocal) :-
    insert_arg(LastUsed, LastLocal, 0, X, LastLocal, 1).

build_arg_list(1, vars(LastUsed, LastLocal), 1,[X|[]], RetLastLocal) :-
    insert_arg(LastUsed, LastLocal,1,X, RetLastLocal, 1).
