/* 
   Test Runner - Warehouse Agents
   Purpose: Centralized testing interface for all agent models
*/

:- use_module('../knowledge_base/warehouse_facts').
:- use_module('../agents/simple_reflex', [simple_reflex/1]).
:- use_module('../agents/model_based_reflex', [model_reflex/1]).
:- use_module('../agents/goal_based', [goal_based/1]).
:- use_module('../agents/utility_based', [utility_agent/1, utility/2]).

% -----------------------------
% Menu Display
% -----------------------------
menu :-
    nl,
    write('========= Warehouse Agent Test Menu ========='), nl,
    write('1. Simple Reflex Agent'), nl,
    write('2. Model-Based Reflex Agent'), nl,
    write('3. Goal-Based Agent'), nl,
    write('4. Utility-Based Agent'), nl,
    write('0. Exit'), nl,
    write('============================================='), nl,
    write('Enter your choice: ').

% -----------------------------
% Menu Controller
% -----------------------------
run :- run_loop.

run_loop :-
    menu,
    read_line_to_string(user_input, Line),
    (string_codes(Line, [Code|_]) ->
        atom_codes(Choice, [Code]),
        (Choice = '0' ->
            write('Exiting test runner. Goodbye!'), nl
        ;
            process_choice(Choice),
            run_loop
        )
    ;
        write('Please enter a valid option.'), nl,
        run_loop
    ).

% Process valid menu choices
process_choice('1') :-
    write('--- Running Simple Reflex Agent ---'), nl,
    simple_reflex:start, nl.

process_choice('2') :-
    write('--- Running Model-Based Reflex Agent ---'), nl,
    model_based_reflex:start, nl.

process_choice('3') :-
    write('--- Running Goal-Based Agent ---'), nl,
    goal_based:start, nl.

process_choice('4') :-
    write('--- Running Utility-Based Agent ---'), nl,
    utility_based:start, nl.

process_choice(_) :-
    write('Invalid option. Please try again.'), nl.
