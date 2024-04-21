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

<table>
  <tr>
    <td>_</td>
    <td>1</td>
    <td>2</td>
    <td>3</td>
    <td>4</td>
  </tr>
  <tr>
    <td>1</td>
    <td>1</td>
    <td>2</td>
    <td>3</td>
    <td>4</td>
  </tr>
  <tr>
    <td>2</td>
    <td>2</td>
    <td>3</td>
    <td>4</td>
    <td>5</td>
  </tr>
  <tr>
    <td>3</td>
    <td>3</td>
    <td>4</td>
    <td>5</td>
    <td>6</td>
  </tr>
  <tr>
    <td>4</td>
    <td>4</td>
    <td>5</td>
    <td>6</td>
    <td>7</td>
  </tr>
</table>


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

## Experiment Number 8

### Obiective

- Write a Program to implement Travelling Salesman Problem.

**Theory/concept**

A traveling salesman has to travel through a bunch of cities, in such a way that the expenses on traveling are minimized. This is the infamous Traveling Salesman Problem (aka TSP) problem.

**Theory**

If you want to get a notion of what numbers we are talking about 100k at this: The number of routes with 50 cities is (50-2)!, which is:

    12,413,915,592,536,072,670,862,289,047,373,375,038,521,486,354,677,760,000,000,000

### Description Of Algorithms

**X2 Algorithm**

- Minimum Spanning Tree (MST).
- Perform preoder tree walk on MST, and construct a list Of the vertices as we encounter them (i.e. each vertex will appear only one - corresponding to its first encounter).
- The output tour is Hamiltonian cycle that visits the vertices in order of this list. The running time of this algorithm is O (n2log (n))time; since the input is a complete graph (n is the number of inserted points). The Find length of the resulting tour is at most twice of the optimal tour, since its length is at most twice that of the MST, and the optimal tour is longer than the MST.

**X1.5 Algorithm**

- Find Minimum Spanning Tree (MST).
- Find minimum weighted matching between Odd vertices of MST.
- Find an Euler tour in resulting graph and create list of vertices that represents it.
- Find Hamilton cycle (which is in fact TSP tour) by visiting vellices in order of created list when only first appearance of vertex in list is encountered and any other appearance is skipped.
- The approximation ratio bound is 1.5, although the argument here is a bit more complicated.
- Iterative Algorithm:
- We generated an arbitrary initial solution, by visiting all points in order they were inserted. Then in each iteration.

1. Select two random cities 2.
2. Interchange the two cities predecessors
3. Calculate the weight of tesulting tour.
4. If new weight is smaller then old one - if so, replace the old tour by the new tour, else undo (2).

### Assignment

Write a Program in prolog to implement Traveling Salesman Problem.

### Solution

```prolog
% Define the distance between two cities
distance((X1, Y1), (X2, Y2), D) :-
    D is sqrt((X2 - X1)**2 + (Y2 - Y1)**2).

% Compute the distance matrix between all cities
distance_matrix([], _, []).
distance_matrix([City|Cities], Cities, [Row|Matrix]) :-
    maplist(distance(City), Cities, Row),
    distance_matrix(Cities, Cities, Matrix).

% Find the minimum spanning tree (MST) using Prim's algorithm
prim_mst([[Start|Rest]|Graph], MST) :-
    prim_mst(Graph, [Start], [], MST, Rest).

prim_mst(_, _, MST, MST, []).
prim_mst(Graph, MSTSoFar, Acc, MST, Remaining) :-
    select(Edge, Remaining, NewRemaining),
    (   (member(Start, MSTSoFar), member(End, Edge), \+ member(End, MSTSoFar))
    ->  MSTNext = [Edge|Acc]
    ;   MSTNext = Acc
    ),
    append(MSTSoFar, Edge, NewMSTSoFar),
    prim_mst(Graph, NewMSTSoFar, MSTNext, MST, NewRemaining).

% Find minimum weighted matching between odd vertices of MST
minimum_matching([], []).
minimum_matching([Vertex|Vertices], [Matching|Matchings]) :-
    minimum_matching(Vertices, Vertex, Matching, OtherVertices),
    minimum_matching(OtherVertices, Matchings).

minimum_matching([], _, [], []).
minimum_matching([Vertex|Vertices], Vertex1, (Vertex1, Vertex), OtherVertices) :-
    minimum_matching(Vertices, Vertex1, Matching, OtherVertices),
    append(Matching, OtherVertices, OtherVertices).
minimum_matching([Vertex|Vertices], Vertex1, Matching, [Vertex|OtherVertices]) :-
    minimum_matching(Vertices, Vertex1, Matching, OtherVertices).

% Find Euler tour
euler_tour(MST, EulerTour) :-
    euler_tour(MST, [Start], EulerTour),
    EulerTour = [Start|_].

euler_tour(_, [End], [End]).
euler_tour(MST, [Current|Visited], [Current|Path]) :-
    member((Current, Next), MST),
    select((Current, Next), MST, NewMST),
    select((Next, Current), NewMST, NewMST1),
    euler_tour(NewMST1, [Next, Current|Visited], Path).
