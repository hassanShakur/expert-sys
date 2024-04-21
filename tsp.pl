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

% Compute TSP tour
tsp_tour(Cities, Tour) :-
    distance_matrix(Cities, Cities, Distances),
    prim_mst(Distances, MST),
    minimum_matching(MST, Matchings),
    flatten(Matchings, FlattenMatchings),
    sort(FlattenMatchings, SortedMatchings),
    euler_tour(SortedMatchings, EulerTour),
    tour_from_euler(EulerTour, Tour).

tour_from_euler([End], [End]).
tour_from_euler([City1, City2|Rest], [City1|Tour]) :-
    tour_from_euler([City2|Rest], Tour).

% Example usage
example_cities([(0, 0), (1, 2), (3, 1), (5, 4), (2, 3)]).

% Goal
goal :-
    example_cities(Cities),
    tsp_tour(Cities, Tour),
    writeln(Tour).

% Run the goal
:- initialization(goal, halt).
