generate_neg_examples(PosExamples, Elements, K, NegExamples) :-
    findall(NegEx,
            (k_permut(Elements, K, Tuple),
             PosTuple=..[pos|Tuple],
             \+ member(PosTuple, PosExamples),
             NegEx=..[neg|Tuple]),
             NegExamples).

k_permut(_,0 , [] ).

k_permut(Elements, K, [X|Rest]) :-
    K > 0,
    member(X, Elements),
    DecK is K-1,
    k_permut(Elements, DecK, Rest).

generate_pos_examples(Pred, PosExamples) :-
    findall(Ex,
            (known_fact(Fact),
             Fact=..[Pred|Args],
             Ex=..[pos|Args]),
             PosExamples).
