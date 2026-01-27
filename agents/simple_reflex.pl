/* =========================================================================
   Simple Reflex Agent
   Purpose: Demonstrate a simple reflex agent that reacts to stock levels
   Environment: Warehouse with multiple items
   ========================================================================= */

:- consult('../knowledge_base/warehouse_facts.pl').  % Load shared warehouse facts

% -----------------------------
% Simple Reflex Rule
% -----------------------------
simple_reflex(Item) :-
    stock(Item, Quantity),       % Get current stock from warehouse_facts.pl
    threshold(T),                % Get threshold from warehouse_facts.pl
    ( Quantity < T ->            % Compare with threshold
        write('You have insufficient items, kindly reorder '), write(Item), nl
    ; 
        write('Not to Worry; stock for '), write(Item), write(' is sufficient'), nl
    ).

% -----------------------------
% Demo Predicate
% -----------------------------
start :-
    write('===== Simple Reflex Agent Demo ====='), nl,
    simple_reflex(apple),
    simple_reflex(banana),
    simple_reflex(mango),
    simple_reflex(orange),
    write('===== End of Demo ====='), nl.
