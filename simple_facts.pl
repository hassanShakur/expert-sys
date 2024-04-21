% Define the simple facts

likes(ram, mango).
girl(seema).
likes(bill, cindy).
red(rose).
owns(john, gold).

% Define the queries to test the facts

query_likes_mango :-
    likes(ram, What),
    format('What: ~w~n', [What]).

query_likes_cindy :-
    likes(Who, cindy),
    format('Who: ~w~n', [Who]).

query_red_rose :-
    red(What),
    format('What: ~w~n', [What]).

query_owns_gold :-
    owns(Who, gold),
    format('Who: ~w~n', [Who]).

% Main goal to test the facts

goal :-
    query_likes_mango,
    query_likes_cindy,
    query_red_rose,
    query_owns_gold.

% Run the goal to test the facts

:- initialization(goal, halt).
