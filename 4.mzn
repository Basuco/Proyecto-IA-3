include "alldifferent.mzn";

int: k; % Paradas adicionales
int: n; % Pisos

set of int: dom = 1..n;
set of int: dom2 = 1..k+2; % Cantidad de pisos por ascensor
set of int: posibles = n..n; %posible numero de pisos
array[1..n,1..n] of var dom: p;

% Cada par de pisos estan conectados por almenos un ascensor
constraint exists (q in posibles) (
    forall (i in 1..q)(p[i,1]=1 /\ p[i,2]=n) /\
    forall (i,j in 1..n where i!=j)(
       exists(k in 1..q,k2,k3 in dom2 where k2!=k3)(p[k,k2]=i /\ p[k,k3]=j)));
var int: q=sum ( i in 1..n ) ( bool2int(p[i,3]!=1) );
solve satisfy;
output [ "M: ",show(q), "\n" ] ++ [ show(p[i,j]) ++ if j == k+2 then "\n" else " " endif |i in dom2, j in dom2] ++ ["\n"];

