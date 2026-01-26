/* =========================================================================
   Simple Reflex Agent - Warehouse Inventory (Group 15)
   Author: Zenith Coders
   Purpose: Demonstrate a simple reflex agent that reacts to stock levels
   Environment: Warehouse with multiple items
   Logic:
     1. Observe current stock for an item
     2. Compare with threshold (10 units)
     3. If stock < threshold -> suggest reorder
     4. Else -> stock is sufficient
   ========================================================================= */

:- dynamic stock/2.  % Allows stock levels to be updated dynamically

% -----------------------------
% Initial Stock Levels
% -----------------------------
stock(apple, 15).
stock(banana, 8).
stock(mango, 5).

% -----------------------------
% Simple Reflex Rule
% -----------------------------
simple_reflex(Item) :-
    stock(Item, Quantity),       % Get current stock
    Threshold = 10,              % Minimum stock level
    ( Quantity < Threshold ->    % Compare with threshold
        write('You have insufficient items, kindly reorder '), write(Item), nl
    ; 
        write('Not to Worry; stock for'), write(Item), write(' is sufficient'), nl
    ).

% -----------------------------
% Demo Predicate
% -----------------------------
start :-
    write('===== Simple Reflex Agent Demo ====='), nl,
    simple_reflex(apple),
    simple_reflex(banana),
    simple_reflex(mango),
    write('===== End of Demo ====='), nl.