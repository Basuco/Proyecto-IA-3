include "alldifferent.mzn";

int: k; % Paradas adicionales
int: n; % Pisos

set of int: dom = 1..n;
set of int: dom2 = 1..k+2; % Cantidad de pisos por ascensor
int: m = ceil((n-2)/k);
array[1..m,dom2] of var dom: p;

% Todos los ascensores van al piso 1 y n
constraint forall (i in 1..m)(p[i,1]=1 /\ p[i,2]=n);

% Cada par de pisos estan conectados por almenos un ascensor
constraint forall (i,j in 1..n where i!=j)(
  exists(k in 1..m,k2,k3 in dom2 where k2!=k3)(p[k,k2]=i /\ p[k,k3]=j));

solve satisfy;
output  ["M= ",show(m),"\n"] ++ [ show_int(1,p[i,j]) ++ " " ++ 
         if j mod (k+2) == 0 then "\n" else "" endif
         | i in 1..m, j in dom2 ] ++ ["\n"];


