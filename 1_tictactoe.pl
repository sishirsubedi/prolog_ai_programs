
player(x).
player(o).
row(1).
row(2).
row(3).
col(1).
col(2).
col(3).


p(x,1,1).
p(x,2,3).
p(o,3,1).
p(o,3,3).



b(x,R,C) :- row(R),col(C),player(x),\+p(x,R,C), player(o), \+p(o,R,C).
b(o,R,C) :- row(R),col(C),player(o),\+p(o,R,C), player(x), \+p(x,R,C).

twoinRow(X,R,C) :- player(X), row(R), col(C), C1 is C + 1, C2 is C+2, 
                   b(X,R,C),p(X,R,C1),p(X,R,C2).
twoinRow(X,R,C) :- player(X), row(R), col(C), C1 is C - 1, C2 is C+1, 
                   b(X,R,C),p(X,R,C1),p(X,R,C2).
twoinRow(X,R,C) :- player(X), row(R), col(C), C1 is C - 2, C2 is C-1, 
                   b(X,R,C),p(X,R,C1),p(X,R,C2).

twoinCol(X,R,C) :- player(X), row(R), col(C), R1 is R + 1, R2 is R + 2, 
                   b(X,R,C),p(X,R1,C),p(X,R2,C).
twoinCol(X,R,C) :- player(X), row(R), col(C), R1 is R - 1, R2 is R + 1, 
                   b(X,R,C),p(X,R1,C),p(X,R2,C).
twoinCol(X,R,C) :- player(X), row(R), col(C), R1 is R - 2, R2 is R - 1, 
                   b(X,R,C),p(X,R1,C),p(X,R2,C).

twoinDiag(X,R,C) :-player(X), row(R), col(C), 
                   R1 is R + 1, R2 is R + 2,
                   C1 is C + 1, C2 is C+2,
                   b(X,R,C),p(X,R1,C1),p(X,R2,C2).

twoinDiag(X,R,C) :-player(X), row(R), col(C), 
                   R1 is R - 1, R2 is R + 1,
                   C1 is C - 1, C2 is C+1,
                   b(X,R,C),p(X,R1,C1),p(X,R2,C2).

twoinDiag(X,R,C) :-player(X), row(R), col(C), 
                   R1 is R - 1, R2 is R - 2,
                   C1 is C - 1, C2 is C-2,
                   b(X,R,C),p(X,R1,C1),p(X,R2,C2).

twoinDiag(X,R,C) :-player(X), row(R), col(C), 
                   R1 is R - 1, R2 is R - 2,
                   C1 is C + 1, C2 is C+2,
                   b(X,R,C),p(X,R1,C1),p(X,R2,C2).

twoinDiag(X,R,C) :-player(X), row(R), col(C), 
                   R1 is R - 1, R2 is R + 1,
                   C1 is C + 1, C2 is C-1,
                   b(X,R,C),p(X,R1,C1),p(X,R2,C2).

twoinDiag(X,R,C) :-player(X), row(R), col(C), 
                   R1 is R + 1, R2 is R + 2,
                   C1 is C - 1, C2 is C - 2,
                   b(X,R,C),p(X,R1,C1),p(X,R2,C2).

canWin(X,R,C) :- twoinCol(X,R,C).
canWin(X,R,C) :- twoinRow(X,R,C).
canWin(X,R,C) :- twoinDiag(X,R,C). 

forcedMove(X,R,C) :- \+canWin(X,R,C),player(Z),canWin(Z,R,C).

ttt_move(X,R,C) :- canWin(X,R,C), format("go for win").

ttt_move(X,R,C) :- forcedMove(X,R,C), format("move to block opponent").

ttt_move(X,R,C) :- b(X,R,C), format("move 1st empty").


