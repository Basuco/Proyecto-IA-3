% Representacion de cada pieza
% 1 = F
% 2 = I
% 3 = L
% 4 = N
% 5 = P
% 6 = T
% 7 = U
% 8 = V
% 9 = W
% 10 = X
% 11 = Y
% 12 = Z

int: m; % Numero de filas
int: n; % Numero de columnas

constraint assert(m>=3 \/ n>=3, "No es posible realizar el cubrimiento con las dimensiones proporsionadas\n");
constraint assert(m*n >= 60, "No es posible realizar el cubrimiento con las dimensiones proporsionadas\n");

array[1..m,1..n] of 1..12: board;
% Llenando el tablero inicial
%constraint forall(i in 1..m,j in 1..n)(
%  if board[i,j] > 0 then board[i,j] = start[i,j] else true endif);

% F
constraint forall(k in 1..12)(
  if k==1 then %F
    exists(i in 1..m,j in 1..n)(
        (board[i,j]==1 /\
        board[i+1,j]==1 /\
        board[i,j-1]==1 /\
        board[i-1,j]==1 /\
        board[i-1,j+1]==1) \/

        (board[i,j]=1 /\
        board[i-1,j]==1 /\
        board[i,j-1]==1 /\
        board[i,j+1]==1 /\
        board[i+1,j+1]==1) \/

        (board[i,j]=1 /\
        board[i-1,j]==1 /\
        board[i,j+1]==1 /\
        board[i+1,j]==1 /\
        board[i+1,j-1]==1) \/

        (board[i,j]=1 /\
        board[i+1,j]==1 /\
        board[i,j+1]==1 /\
        board[i,j-1]==1 /\
        board[i-1,j-1]==1) \/

        % ------- FLIP -------
        (board[i,j]==1 /\
        board[i,j+1]==1 /\
        board[i+1,j]==1 /\
        board[i-1,j]==1 /\
        board[i-1,j-1]==1) \/

        (board[i,j]=1 /\
        board[i+1,j]==1 /\
        board[i,j-1]==1 /\
        board[i,j+1]==1 /\
        board[i-1,j+1]==1) \/
        
        (board[i,j]=1 /\
        board[i-1,j]==1 /\
        board[i,j-1]==1 /\
        board[i+1,j]==1 /\
        board[i+1,j+1]==1) \/

        (board[i,j]=1 /\
        board[i,j+1]==1 /\
        board[i-1,j]==1 /\
        board[i,j-1]==1 /\
        board[i+1,j-1]==1)
        )
  elseif k==2 then %I
     exists(i in 1..m,j in 1..n where board[i,j]!=0)(
        board[i,j]=2 /\
        board[i+1,j]=2 /\
        board[i+2,j-1]=2 /\
        board[i-1,j]=2 /\
        board[i-2,j]=2)
  else true endif
  );
% I

% L
%constraint assert(
%      exists(i in 1..m,j in 1..n where board[i,j]!=0)(
%        board[i,j]=3 /\
%        board[i+1,j]=3 /\
%        board[i+1,j+1]=3 /\
%        board[i-1,j]=3 /\
%        board[i-2,j]=3),"No es posible realizar el cubrimiento con las dimensiones proporsionadas\n");

% N
%constraint assert(
%      exists(i in 1..m,j in 1..n where board[i,j]!=0)(
%        board[i,j]=3 /\
%        board[i+1,j]=3 /\
%        board[i+1,j+1]=3 /\
%        board[i-1,j]=3 /\
%        board[i-2,j]=3),"No es posible realizar el cubrimiento con las dimensiones proporsionadas\n");

solve satisfy;

output  [ show_int(1,board[i,j]) ++ " " ++ 
         if j == n then "\n" else "" endif
         | i in 1..m, j in 1..n ] ++ ["\n"];