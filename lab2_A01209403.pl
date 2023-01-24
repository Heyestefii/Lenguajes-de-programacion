% ITESM QRO 
% Diana Estefanía Ortiz Ledesma
% A01209403 
% Prolog - Lab 2

% any_positive
% is true if there is a positive number on the given list

any_positive([A|B]):- 
    A > 0;
    any_positive(B). 

% Example
% any_positive([-1,-2, 3,-4]). 
% any_positive([-1,-2, -3,-4]). 

% substitute
% substitutes all instances of the list and returns a new one

substitute(_A,_B,[],[]):-!.
substitute(A,B,[F|R],[B|X]):- 
    F == A,
    substitute(A,B,R,X).
substitute(A,B,[F|R],[F|X]):- 
    substitute(A,B,R,X).

% Example
% substitute(2,3,[1, 2, 2, 2, 3, 2],X). 

% eliminate_duplicates
% eliminates all duplicates and returns a new list

contains(A,[F|R]):-
    A == F;
    contains(A,R).

eliminate_duplicates([],[]):-!.
eliminate_duplicates([F|R],X):-
    eliminate_duplicates(R,X),
    contains(F,X).
eliminate_duplicates([F|R],[F|X]):- 
    eliminate_duplicates(R,X).

% Example
% eliminate_duplicates([a, a, a, a, b, c, c, a, a, d, e, e, e, e],X). 

% intersect
% eliminates all items that are not shared between lists
intersect([],_A,[]):-!.
intersect([F|R],A,[F|X]):-
    contains(F,A),
    intersect(R,A,X).
intersect([_F|R],A,X):- 
    intersect(R,A,X).

% Example
% intersect([a, b, c, d],[b, d, e, f],X). 

% invert
% inverts the order of the items in list

invert_2(A,X):-
    invert(A,X,[]).
invert([],X,X):-!.
invert([F|R],X,A):-
    NewList = [F|A],
    invert(R,X,NewList).

% Example
% invert_2([a, b, e, c, e],X). 

% less_than
% return a list that contains all the numbers lesser than X 

less_than(_A,[],[]):-!.
less_than(A,[F|R],[F|X]):-
    F < A,
    less_than(A,R,X).
less_than(A,[_F|R],X):-
    less_than(A,R,X).

% Example
% less_than(5,[1, 6, 5, 2, 7],X). 

% more_than
% return a list that contains all the numbers greater or equal to X 

more_than(_A,[],[]):-!.
more_than(A,[F|R],[F|X]):-
    F >= A,
    more_than(A,R,X).
more_than(A,[_F|R],X):-
    more_than(A,R,X).

% Example
% more_than(5,[1, 6, 5, 2, 7],X). 
