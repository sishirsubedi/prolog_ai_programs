row(1).
row(2).
row(3).
row(4).
col(1).
col(2).
col(3).
col(4).

room(X,Y) :- row(X),col(Y).

adjacent(X,Y,P,Q) :- room(X,Y) , P is X , Q is Y+1 , room(P,Q).
adjacent(X,Y,P,Q) :- room(X,Y) , P is X , Q is Y-1 , room(P,Q).
adjacent(X,Y,P,Q) :- room(X,Y) , P is X+1 , Q is Y , room(P,Q).
adjacent(X,Y,P,Q) :- room(X,Y) , P is X-1 , Q is Y , room(P,Q).
%adjacent(X,Y,P,Q) :- room(X,Y) , P is X+1 , Q is Y+1 , room(P,Q).
%adjacent(X,Y,P,Q) :- room(X,Y) , P is X-1 , Q is Y-1 , room(P,Q).

pit(1,3).
pit(3,3).
pit(4,4).
wumpus(3,1).

visited(1,1).
visited(2,1).
visited(1,2).
visited(2,2).



breeze(1,2).
breeze(X,Y) :- room(X,Y) , pit(P,Q) , adjacent(X,Y,P,Q).

stench(2,1).
stench(X,Y) :- room(X,Y) , wumpus(P,Q) , adjacent(X,Y,P,Q).


no_wumpus(X,Y) :- adjacent(X,Y,P,Q) , visited(P,Q) , \+(stench(P,Q)).
no_pit(X,Y) :- adjacent(X,Y,P,Q) , visited(P,Q) , \+(breeze(P,Q)).

move(X,Y) :- no_wumpus(X,Y) , no_pit(X,Y), \+visited(X,Y).

candidate(X,Y) :- adjacent(X,Y,P,Q) , visited(P,Q), \+visited(X,Y).



