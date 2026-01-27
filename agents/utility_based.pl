/* 
   Utility-Based Agent 
   Purpose: Demonstrate a utility-based agent that chooses actions
            based on a utility value
   Environment: Warehouse with multiple items
   */

:- consult('../knowledge_base/warehouse_facts.pl').

% -----------------------------
% Utility Calculation
% -----------------------------
utility(Item, Utility) :-
    stock(Item, Quantity),
    threshold(T),
    Utility is Quantity - T.

% -----------------------------
% Utility-Based Decision Rule
% -----------------------------
utility_agent(Item) :-
    utility(Item, U),
    ( U < 0 ->
        write('Reorder '), write(Item),
        write(', utility = '), write(U), nl
    ;
        write('Stock for '), write(Item),
        write(' is optimal, utility = '), write(U), nl
    ).

% -----------------------------
% Demo Predicate
% -----------------------------
start :-
    write('===== Utility-Based Agent Demo ====='), nl,
    utility_agent(apple),
    utility_agent(banana),
    utility_agent(mango),
    utility_agent(orange),
    write('===== End of Demo ====='), nl.
