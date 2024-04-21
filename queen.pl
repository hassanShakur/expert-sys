% Define the predicate to remove an element from a list
del(I, [I|L], L).
del(I, [F|L], [F|L1]) :- del(I, L, L1).

% Define the permutation predicate
permutation([], []).
permutation([H|T], PL) :- permutation(T, PT), del(H, PL, PT).

% Define the noattack predicate to check if no queens attack each other
noattack(_, [], _).
noattack((Y, _), [(Y1, Ydist)|_], Xdist) :-
    Y1 - Y =\= Xdist,
    Y - Y1 =\= Xdist,
    noattack((Y, _), Ydist, Xdist).

% Define the safe predicate to check if the current permutation is safe
safe([]).
safe([(Y, Ydist)|Others]) :-
    safe(Others),
    noattack((Y, Ydist), Others, 1).

% Define the solution predicate to find the solution to the 4-Queen problem
solution(Q) :-
    permutation([1,2,3,4], Q),
    safe(Q).

% Convert the solution to the desired output format
format_output([], []).
format_output([(Y, _)|Others], [Y1|Result]) :-
    Y1 is Y + 1,
    format_output(Others, Result).

% Main goal to find the solution and format the output
goal(Q) :-
    solution(Q),
    format_output(Q, FormattedQ),
    format('Solution: Q = ~w~n', [FormattedQ]).

% Run the goal to get the solution
:- initialization(goal(Q), halt).
