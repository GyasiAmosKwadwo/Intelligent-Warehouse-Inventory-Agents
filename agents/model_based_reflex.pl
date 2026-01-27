/* 
   Model-Based Reflex Agent - Warehouse Inventory
   Purpose: Demonstrate a model-based reflex agent with memory
   Environment: Warehouse with multiple items
*/

:- module(model_based_reflex, [start/0, model_reflex/1]).

% Import the shared warehouse facts module
:- use_module('../knowledge_base/warehouse_facts').
:- dynamic observed/2.  % Keeps memory of last observed stock

% -----------------------------
% Model-Based Reflex Rule
% -----------------------------
model_reflex(Item) :-
    stock(Item, Quantity),  % Current stock from warehouse_facts
    threshold(T),           % Threshold from warehouse_facts
    % Check if we observed this item before
    ( observed(Item, LastQuantity) ->
        ( Quantity < LastQuantity ->
            write('Attention! Stock for '), write(Item),
            write(' has decreased from '), write(LastQuantity),
            write(' to '), write(Quantity), nl
        ;
            true
        )
    ;
        true
    ),
    % Decide whether to reorder
    ( Quantity < T ->
        write('You have insufficient items, kindly reorder '), write(Item), nl
    ;
        write('Not to worry; stock for '), write(Item), write(' is sufficient'), nl
    ),
    % Update memory
    retractall(observed(Item, _)),
    assert(observed(Item, Quantity)).

% -----------------------------
% Demo Predicate
% -----------------------------
start :-
    write('===== Model-Based Reflex Agent Demo ====='), nl,
    model_reflex(apple),
    model_reflex(banana),
    model_reflex(mango),
    model_reflex(orange),
    write('===== End of Demo ====='), nl.
