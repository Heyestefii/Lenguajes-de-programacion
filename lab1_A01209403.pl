% ITESM QRO
% Diana Estefanía Ortiz Ledesma
% A01209403
% Prolog - Lab 1 

hobby(juan,kaggle).
hobby(luis,hack).
hobby(elena,tennis).
hobby(midori,videogame).
hobby(simon,sail).
hobby(simon,kaggle).
hobby(laura,hack).
hobby(hans,videogame).

% Rule 
% Compatible(X,Y) 
% We say that X and Y are compatible if they share at least 1 hobby. 
compatible(X,Y):- hobby(X,hobby_2), hobby(Y,hobby_2). 

% Example 
compatible(luis, laura).


road(placentia,ariminum).
road(ariminum,ancona).
road(ariminum,roma).
road(ancona,roma).
road(ancona,truentinum).
road(truentinum,roma).
road(placentia,genua).
road(genua,pisae).
road(genua,roma).
road(pisae,roma).
road(brundisium,capua).
road(syracusae,catina).
road(catina,messana).
road(messana,capua).
road(capua,roma).
road(lilibeus,messana).
road(rhegium,capua).

% Rule
% can_get_to(Origin,Destination)
% Is true if there is a path that stars in Origin and following the directionality
% of the roads can get to Destination. 
can_get_to(Origin,Destination):-
	road(Origin,Destination); 
	road(Origin,Destination_2),
	can_get_to(Destination_2, Destination).

% Example
% can_get_to(roma, pisae).

% Rule
% size(X,Y,Z)
% returns in Z the number of cities crossed in the path from X to Y
size(X,Y,Z):-
    road(X,Y),
    Z is 0;
    road(X,A),
    size(A,Y,Z1),
    Z is Z1 + 1.

% Example
% size(placentia,roma,Z).

% Rule
% min(A, B, C, Z)
% returns Z as the minimal value between A, B and C
min(A,B,C,Z):-
    A < B,
    A < C,
    Z is A;
    B < C,
    Z is B;
    Z is C.

% Example
% min(6,9,2,Z). 

% Rule
% gcd(A,B,Z)
% returns Z as the greatest common divisor of A and B.
gcd(0,A,A).
gcd(A,0,A).
gcd(A,B,Z):-
    B1 is mod(A,B),
    gcd(B,B1,Z).

% Example
% gcd(13,5,Z).