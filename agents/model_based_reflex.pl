/* =========================================================================
   Model-Based Reflex Agent - Warehouse Inventory (Group 15)
   Author: Zenith Coders
   Purpose: Demonstrate a model-based reflex agent with memory
   Environment: Warehouse with multiple items
   Logic:
     1. Observe current stock for an item
     2. Compare with threshold (10 units)
     3. Update internal state (memory) of last observed stock
     4. Decide whether to reorder
     5. Report if stock has changed since last check
   =========================================================================
    */

:- dynamic stock/2.
:- dynamic observed/2.

% -----------------------------
% Initial Stock Levels
% -----------------------------
stock(apple, 15).
stock(banana, 8).
stock(mango, 5).

% -----------------------------
% Model-Based Reflex Rule
% -----------------------------
model_reflex(Item) :-
    stock(Item, Quantity),
    Threshold = 10,
    ( observed(Item, LastQuantity) ->
        ( Quantity < LastQuantity ->
            write('Attention! Stock for '), write(Item), write(' has decreased from '),
            write(LastQuantity), write(' to '), write(Quantity), nl
        ;
            true
        )
    ;
        true
    ),
    ( Quantity < Threshold ->
        write('You have insufficient items, kindly reorder '), write(Item), nl
    ; 
        write('Not to worry; stock for '), write(Item), write(' is sufficient'), nl
    ),
    retractall(observed(Item, _)),  % Update memory
    assert(observed(Item, Quantity)).

% -----------------------------
% Demo Predicate
% -----------------------------
start :-
    write('===== Model-Based Reflex Agent Demo ====='), nl,
    model_reflex(apple),
    model_reflex(banana),
    model_reflex(mango),
    write('===== End of Demo ====='), nl.