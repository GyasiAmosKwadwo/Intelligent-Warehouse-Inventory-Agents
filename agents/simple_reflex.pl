/* 
   Simple Reflex Agent - Warehouse Inventory
   Purpose: Demonstrate a simple reflex agent that reacts to stock levels
   Environment: Warehouse with multiple items
*/

:- module(simple_reflex, [start/0, simple_reflex/1]).

% Import the shared warehouse facts module
:- use_module('../facts/warehouse_facts').

% -----------------------------
% Simple Reflex Rule
% -----------------------------
simple_reflex(Item) :-
    stock(Item, Quantity),       % Get current stock from warehouse_facts
    threshold(T),                % Get threshold from warehouse_facts
    ( Quantity < T ->            % Compare with threshold
        write('You have insufficient items, kindly reorder '), write(Item), nl
    ; 
        write('Not to worry; stock for '), write(Item), write(' is sufficient'), nl
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
