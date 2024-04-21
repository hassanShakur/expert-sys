# Expert System Assignment

## Experiment Number 1

### Objective

- Study of Prolog

### Solution

Prolog is a high-level programming language based on formal logic. It is particularly well-suited for tasks that involve symbolic computation and relational data. In Prolog, you define a set of facts and rules, and then you can pose queries to the Prolog interpreter, which uses logical inference to find solutions.

### Key Concepts in Prolog

1. **Facts**: Facts are statements that are assumed to be true. They represent the basic knowledge base in Prolog.

   ```prolog
   sister(sue, bill).
   parent(ann, sam).
   male(jo).
   female(riya).
   ```

2. **Rules**: Rules define relationships between facts. They are used to infer new facts based on existing ones.

   ```prolog
   grandfather(X, Y) :-
       parent(X, Z),
       parent(Z, Y),
       male(X).
   ```

3. **Queries**: Queries are posed to the Prolog interpreter to find solutions based on the defined facts and rules.

   ```prolog
   ?- grandfather(X, Y).
   X = jo,
   Y = sam.
   ```

### Prolog Example

Let's consider a simple Prolog program to define family relationships:

```prolog
% Facts
sister(sue, bill).
parent(ann, sam).
male(jo).
female(riya).

% Rules
grandfather(X, Y) :-
    parent(X, Z),
    parent(Z, Y),
    male(X).
```

Save this code in a file, say `family.pl`, and load it into a Prolog interpreter using `consult/1` predicate:

```prolog
?- consult('family.pl').
```

After loading the file, you can pose queries to the Prolog interpreter:

```prolog
?- grandfather(X, Y).
X = jo,
Y = sam.
```

### Prolog Working Environment

To work with Prolog, you can use various Prolog interpreters available. Some popular Prolog interpreters are:

- SWI-Prolog
- GNU Prolog
- SICStus Prolog
- YAP Prolog

#### Running Prolog Programs

1. **SWI-Prolog**: Open the SWI-Prolog interpreter and load your Prolog file using `consult/1` predicate:

   ```prolog
   ?- consult('family.pl').
   ```

2. **GNU Prolog**: Open the GNU Prolog interpreter and load your Prolog file using `[filename].`:

   ```prolog
   | ?- [family].
   ```

3. **SICStus Prolog**: Open the SICStus Prolog interpreter and load your Prolog file using `consult/1` predicate:

   ```prolog
   | ?- consult('family.pl').
   ```

After loading the file, you can pose queries to the Prolog interpreter to test your facts and rules.

## Experiment Number 2

### Objective

- Write simple fact for following:

```txt
a. Ram likes mango.
b, Seema is a girl,
c. Bill likes Cindy.
d, Rose is red,
e. John owns gold.
Program:
Clauses
likes(ram ,mango).
girl(seema). red(rose).
likes(bill ,cindy).
owns(john ,gold),
Output:
Goal queries
What).
What= mango
Who: Cindy
What— rose
Who—john What= gold.
OUTCOME: Student will understand how to write simple facts using prolog.
Assignment:
Write simple fact for following:
a. Ram likes mango.
b. Seema is a girl.
c. Bill likes Cindy.
d, Rose is red.
e. John owns gold.
```

### Solution

```prolog
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
```

#### Instructions to Run:

1. Save the above program in a file, for example, `simple_facts.pl`.
2. Open a Prolog interpreter.
3. Load the file using `consult/1` predicate:

```prolog
?- consult('simple_facts.pl').
```

4. Once loaded, execute the `goal` query to test the defined facts:

```prolog
?- goal.
```

This will execute the queries defined in the `goal` predicate and print the results based on the simple facts provided.

## Experiment Number 6

### Objective

- Write a program to implement factorial, fibonacci for a given number

### Solution

#### Factorial Program

```prolog
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
```

#### Fibonacci Program

```prolog
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
```

#### Instructions to Run:

1. Save the Factorial program in a file, say `factorial.pl`.
2. Save the Fibonacci program in a file, say `fibonacci.pl`.
3. Open a Prolog interpreter and load the respective file.
4. Run the `goal_factorial(N, Result)` or `goal_fibonacci(N, Result)` query with the desired value of `N`.

For example, to compute the factorial of 5 using the Factorial program, you'd run:

```prolog
?- consult('factorial.pl').
?- goal_factorial(5, Result).
```

Similarly, to compute the 10th Fibonacci number using the Fibonacci program, you'd run:

```prolog
?- consult('fibonacci.pl').
?- goal_fibonacci(10, Result).
```

This will print the computed factorial and Fibonacci number respectively.

## Experiment Number 7

### Objective

- Write a program to solve 4-Queen problem.

In the 4 Queens problem the object is to place 4 queens on a chessboard in
such a way that no queens can capture a piece. This means that no two queens
may be placed on the same row, column, or diagonal.

Table depiction:
_  1  2  3  4
1  1  2  3  4
2  2  3  4  5
3  3  4  5  6
4  4  5  6  7

1. Represent the board positions as 8*8 vector, i.e. [1,2,3,4,5,6,7,8]. Store the set of queens in the list Q.
2. Calculate the permutation of the above eight numbers stored in set P.
3. Let the position where the first queen to be placed be (1, Y), for the second be (2, Y1) and so on and store the positions in Q.
4. Check for the safety of the queens through the predicate, 'noattack()'.
5. Calculate Y1-Y and Y-Y1. If both are not equal to Xdist , which is the X-distance between the first queen and others, then go to Step 6 else go to Step 7.
6. Increment Xdist by 1.
7. Repeat the above for the rest of the queens, until the end of the list is reached.
8. Print Q as answer.
9. Exit.

### Solution

Certainly! Below is a Prolog program to solve the 4-Queen problem as per the given instructions:

```prolog
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
```

