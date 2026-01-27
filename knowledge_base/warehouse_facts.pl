/*
 contains facts about the stock levels of various items in a warehouse.
*/

:- module(warehouse_facts, [
    threshold/1,
    stock/2,
    past_stock/2,
    order_history/2
]).

% Minimum stock threshold
threshold(10).

% Current stock
stock(apple, 5).
stock(banana, 15).
stock(orange, 8).
stock(mango, 7).

% For the model-based agent
past_stock(apple, [12, 10, 7, 5]).
past_stock(banana, [20, 18, 15]).
past_stock(orange, [10, 9, 8]).
past_stock(mango, [12, 10, 9, 7]).

% For the utility-based agent
order_history(apple, [5, 10]).
order_history(banana, [5]).
order_history(orange, [8]).
order_history(mango, [7, 5]).
