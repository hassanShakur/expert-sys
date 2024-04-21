% Define the Fibonacci predicate
fib(0, 0).
fib(1, 1).
fib(N, Result) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fib(N1, F1),
    fib(N2, F2),
    Result is F1 + F2.

% Main goal to compute Fibonacci
goal_fibonacci(N, Result) :-
    fib(N, Result),
    format('Fibonacci number at position ~w is ~w~n', [N, Result]).

% Run the goal to compute Fibonacci
:- initialization(goal_fibonacci(10, Result), halt).
