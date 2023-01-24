% ITESM QRO 
% Prolog - Lab 3 
% Estefania Ortiz 
% A01209403 

first([F|_R],FI):-
    FI = F.

remove_first([_F|R],A1):-
    A1 = R.

left(OA,N,LS1,LS1,OA):-
    N == 0.

left(OA,N,LS,OLS,RS):-
    update(OA,OLS,UA,ULS),
    N2 is N - 1,
    left(UA,N2,LS,ULS,RS).

sides(OA,N,LS,RS):-
    left(OA,N,LS,[],RS).

value(V,V1):-
    V1 is V + 0.5.

pair_ou_impair(V):-
    Condition is V mod 2,
    Condition == 0.

append([F|R],L2,Result):-
    R == [],
    Result = [F|L2];
    append(R,L2,Aux),
    Result = [F|Aux].

append_aux([],I,I2):-
    I2 = [I|[]].

append_aux([F|R],I,A1):-
    append_aux(R,I,A2),
    A1 = [F|A2].

length1(A,L):-
    length_aux(A,0,L).

length_aux([],PL,PL):-!.

length_aux([_|R],PL,L):-
    PL2 is PL + 1,
    length_aux(R,PL2,L).

update(OA,OLS,UA,ULS):-
    first(OA,FI),
    append_aux(OLS,FI,ULS),
    remove_first(OA,UA).

setN(A,N):-
    length1(A,L),
    setN(L,N).

setN(L,N):-
    pair_ou_impair(L),
    N is L / 2;
    value(L/2,N1),
    N is integer(N1).

order_aux([],[],PA,PA):-!.

order_aux(L1,[],PA,OL):-
    append(PA,L1,OL).

order_aux([],L2,PA,OL):-
    append(PA,L2,OL).

order_aux([F1|R1],[F2|R2],OA,OL):-
    F1 =< F2,
    append_aux(OA,F1,PA),
    order_aux(R1,[F2|R2],PA,OL).

order_aux([F1|R1],[F2|R2],OA,OL):-
    append_aux(OA,F2,PA),
    order_aux([F1|R1],R2,PA,OL).

order(L1,L2,OL):-
    order_aux(L1,L2,[],OL).

merge_sort(A,A):-
    length1(A,L),
    L == 1.

merge_sort(OA,R):-
    setN(OA,N),
    sides(OA,N,LS,RS),
    merge_sort(LS,LB),
    merge_sort(RS,RB),
    order(LB,RB,R).

% merge_sort([1, 6, 2, 7],R).
% Result = [1, 2, 6, 7]
% merge_sort([13, 46, 25, 12, 27, 1],R).
% Result = [1, 12, 13, 25, 27, 46]


