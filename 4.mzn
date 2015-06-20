include "alldifferent.mzn";

int: k; % Paradas adicionales
int: n; % Pisos
%int: m1 = ceil((n-2)/k);
set of int: dom = 1..n;
set of int: dom2 = 1..k+2; % Cantidad de pisos por ascensor
array[1..(n-2),dom2] of var dom: p;

var int: m;
constraint m > 0 /\ m <= n;
%set of int: dom3 = 1..m;


% Todos los ascensores van al piso 1 y n
constraint forall (i in 1..m)(p[i,1]=1 /\ p[i,2]=n);

% Cada par de pisos estan conectados por almenos un ascensor
constraint forall (i,j in 2..(n-1) where i!=j)(
  exists(k in 1..m,k2,k3 in dom2 where k2!=k3)(p[k,k2]=i /\ p[k,k3]=j));

solve minimize m;

output  ["M= ",show(m),"\n"];

%output  ["M= ",show(m),"\n"]++[ show(p[i,j]) ++ " " ++ 
%         if j == (k+2) then "\n" else "" endif
%         | i in 1..n, j in dom2 ] ++ ["\n"];


