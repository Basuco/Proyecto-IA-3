include "alldifferent.mzn";

int: k; % Paradas adicionales
int: n; % Pisos

set of int: dom = 1..n;
set of int: dom2 = 1..k+2; % Cantidad de pisos por ascensor
set of int: posibles = ceil((n-2)/k)..n;
array[1..n,dom2] of var dom: p;
var posibles: q;
array[1..n] of var dom: g;

predicate count(array[int] of var int: x, var int: y, var int: c) =
c==sum ( i in index_set(x) ) ( bool2int(x[i]==y) );

% Cada par de pisos estan conectados por almenos un ascensor
constraint exists (q in posibles) (
    forall (i in 1..q)(p[i,1]=1 /\ p[i,2]=n /\ g[i]=n) /\
    forall (i,j in 1..n where i!=j)(
       exists(k in 1..q,k2,k3 in dom2 where k2!=k3)(p[k,k2]=i /\ p[k,k3]=j)));
constraint count(g,n,q);
solve satisfy;
output  ["M= ",show(q),"\n"] ++ [ show_int(1,p[i,j]) ++ " " ++ 
         if (j mod (k+2) == 0) then "\n" else "" endif
         | i in dom2, j in dom2 ] ++ ["\n"];
