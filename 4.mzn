include "alldifferent.mzn";

int: k; % Paradas adicionales
int: n; % Pisos

var int: cont=0;
set of int: dom = 1..n;
set of int: dom2 = 1..k+2; % Cantidad de pisos por ascensor
%var int: aux;
int: m = ceil((n-2)/k);
%constraint if (n-2) mod k > 0 then m = m + 1 else true endif;
%int: m = aux; % Numero de Ascensores
array[1..m,dom2] of var dom: p;

constraint forall (i in 1..m)(
  alldifferent([p[i,j] | j in dom2]));

constraint forall(i in 1..m,j in dom2)(
    if j==1 then p[i,j] = 1 
    elseif j==2 then p[i,j] = n
    elseif cont < (n-2) then
      p[i,j] = cont+2/\
      cont = cont+2
      else true
     endif);

solve satisfy;
output  [ show_int(1,p[i,j]) ++ " " ++ 
         if j mod (k+2) == 0 then "\n" else "" endif
         | i in 1..m, j in dom2 ] ++ ["\n"];


