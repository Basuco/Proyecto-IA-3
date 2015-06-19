include "alldifferent.mzn";

int: digs = ceil(log(10.0,int2float(7)));

set of int: PuzzleRange = 1..7;
array[1..7,1..7] of 0..7: start; % Tablero inicial
array[1..7,1..7] of var PuzzleRange: p;

% Llenando el tablero inicial
constraint forall(i,j in PuzzleRange)(
  if start[i,j] > 0 then p[i,j] = start[i,j] else true endif);

% Todos diferentes en filas
constraint forall (i in PuzzleRange)(
  alldifferent([p[i,j] | j in PuzzleRange ]));

% Todos diferentes en columnas
constraint forall (j in PuzzleRange) (
  alldifferent ([p[i,j] | i in PuzzleRange]));

% Todos diferentes en caminos
constraint alldifferent([p[1,1],p[1,2],p[1,3],p[1,4],p[2,4],p[2,5],p[3,5]]);
constraint alldifferent([p[2,1],p[2,2],p[3,1],p[4,1],p[5,1],p[6,1],p[6,2]]);
constraint alldifferent([p[7,1],p[7,2],p[7,3],p[7,4],p[7,5],p[6,6],p[7,6]]);
constraint alldifferent([p[2,7],p[3,7],p[4,6],p[4,7],p[5,7],p[6,7],p[7,7]]);
constraint alldifferent([p[1,5],p[1,6],p[1,7],p[2,6],p[3,6],p[4,5],p[4,4]]);
constraint alldifferent([p[4,3],p[3,3],p[3,4],p[2,3],p[3,2],p[4,2],p[5,3]]);
constraint alldifferent([p[5,2],p[6,3],p[5,4],p[6,4],p[6,5],p[5,5],p[5,6]]);

solve satisfy;

output  [ show_int(digs,p[i,j]) ++ " " ++ 
         if j mod 7 == 0 then "\n" else "" endif
         | i,j in PuzzleRange ] ++ ["\n"];