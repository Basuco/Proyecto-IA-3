include "alldifferent.mzn";

int: k; % Paradas adicionales
int: n; % Pisos
%int: m1 = ceil((n-2)/k);
set of int: dom = 1..n-2;
set of int: dom2 = 1..k; % Cantidad de pisos por ascensor
array[1..m,dom2] of var dom: p;

int: m;

%set of int: dom3 = 1..m;


% Cada par de pisos estan conectados por almenos un ascensor
constraint forall (i,j in 1..(n-2) where i!=j)(
  exists(k in 1..m,k2,k3 in dom2 where k2!=k3)(p[k,k2]=i /\ p[k,k3]=j));

solve minimize m;

output  ["M= ",show(m),"\n"] ++ [ show_int(1,p[i,j]+1) ++ " " ++ 
         if (j ==(k)) then "\n" else "" endif
         | i in 1..m, j in dom2 ] ++ ["\n"];