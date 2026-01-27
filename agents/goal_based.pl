/*
   Goal-Based Reflex Agent - Warehouse Inventory
   Purpose: Demonstrate a goal-based agent that acts to achieve target stock levels
   Environment: Warehouse with multiple items
*/

:- module(goal_based, [start/0, goal_based/1]).

% Import shared warehouse facts
:- use_module('../facts/warehouse_facts').

% -----------------------------
% Goal-Based Agent Rule
% -----------------------------
goal_based(Item) :-
    stock(Item, Quantity),
    threshold(T),
    ( Quantity < T ->
        write('Goal not met! Reorder '), write(Item), nl
    ;
        write('Goal achieved for '), write(Item), nl
    ).

% -----------------------------
% Demo Predicate
% -----------------------------
start :-
    write('===== Goal-Based Agent Demo ====='), nl,
    goal_based(apple),
    goal_based(banana),
    goal_based(mango),
    goal_based(orange),
    write('===== End of Demo ====='), nl.
