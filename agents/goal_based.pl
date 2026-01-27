:- consult('../knowledge_base/warehouse_facts.pl').
goal_based(Item) :-
    stock(Item, Quantity),
    threshold(T),
    ( Quantity < T ->
        write('Goal not met! Reorder '), write(Item), nl
    ;
        write('Goal achieved for '), write(Item), nl
    ).

start :-
    write('===== Goal-Based Agent Demo ====='), nl,
    goal_based(apple),
    goal_based(banana),
    goal_based(mango),
    goal_based(orange),
    write('===== End of Demo ====='), nl.
