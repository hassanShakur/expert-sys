% Define the factorial predicate
factorial(0, 1).
factorial(N, F) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.

% Main goal to compute factorial
goal_factorial(N, Result) :-
    factorial(N, Result),
    format('Factorial of ~w is ~w~n', [N, Result]).

% Run the goal to compute factorial
:- initialization(goal_factorial(5, Result), halt).
