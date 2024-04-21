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

