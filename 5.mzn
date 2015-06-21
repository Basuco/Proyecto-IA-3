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
     exists(i in 1..m,j in 1..n)(
        (board[i,j]==2 /\
        board[i+1,j]==2 /\
        board[i+2,j]==2 /\
        board[i-1,j]==2 /\
        board[i-2,j]==2) \/
        
        (board[i,j]==2 /\
        board[i,j+1]==2 /\
        board[i,j+2]==2 /\
        board[i,j-1]==2 /\
        board[i,j-2]==2))

  elseif k==3 then %L
     exists(i in 1..m,j in 1..n)(
        (board[i,j]==3 /\
        board[i-1,j]==3 /\
        board[i-2,j]==3 /\
        board[i+1,j]==3 /\
        board[i+1,j+1]==3) \/
        
        (board[i,j]==3 /\
        board[i,j+1]==3 /\
        board[i,j+2]==3 /\
        board[i,j-1]==3 /\
        board[i+1,j-1]==3) \/

        (board[i,j]==3 /\
        board[i-1,j]==3 /\
        board[i-1,j-1]==3 /\
        board[i+1,j]==3 /\
        board[i+2,j]==3) \/
      
        (board[i,j]==3 /\
        board[i,j+1]==3 /\
        board[i-1,j+1]==3 /\
        board[i,j-1]==3 /\
        board[i,j-2]==3) \/
        % ----- FLIP -----
        
        (board[i,j]==3 /\
        board[i-1,j]==3 /\
        board[i-2,j]==3 /\
        board[i+1,j]==3 /\
        board[i+1,j-1]==3) \/
        
        (board[i,j]==3 /\
        board[i,j+1]==3 /\
        board[i,j+2]==3 /\
        board[i,j-1]==3 /\
        board[i-1,j-1]==3) \/

        (board[i,j]==3 /\
        board[i-1,j]==3 /\
        board[i-1,j+1]==3 /\
        board[i+1,j]==3 /\
        board[i+2,j]==3) \/
      
        (board[i,j]==3 /\
        board[i,j+1]==3 /\
        board[i+1,j+1]==3 /\
        board[i,j-1]==3 /\
        board[i,j-2]==3))
  
  elseif k==4 then %N
     exists(i in 1..m,j in 1..n)(
        (board[i,j]=4 /\
        board[i-1,j]=4 /\
        board[i-1,j-1]=4 /\
        board[i,j+1]=4 /\
        board[i,j+2]=4) \/

        (board[i,j]=4 /\
        board[i,j+1]=4 /\
        board[i-1,j+1]=4 /\
        board[i+1,j]=4 /\
        board[i+2,j]=4) \/

        (board[i,j]=4 /\
        board[i+1,j]=4 /\
        board[i+1,j+1]=4 /\
        board[i,j-1]=4 /\
        board[i,j-2]=4) \/

        (board[i,j]=4 /\
        board[i,j-1]=4 /\
        board[i+1,j-1]=4 /\
        board[i-1,j]=4 /\
        board[i-2,j]=4) \/

        % ---- FLIP ----
        
        (board[i,j]=4 /\
        board[i+1,j]=4 /\
        board[i+1,j-1]=4 /\
        board[i,j+1]=4 /\
        board[i,j+2]=4) \/

        (board[i,j]=4 /\
        board[i,j-1]=4 /\
        board[i-1,j-1]=4 /\
        board[i+1,j]=4 /\
        board[i+2,j]=4) \/

        (board[i,j]=4 /\
        board[i-1,j]=4 /\
        board[i-1,j+1]=4 /\
        board[i,j-1]=4 /\
        board[i,j-2]=4) \/

        (board[i,j]=4 /\
        board[i,j+1]=4 /\
        board[i+1,j+1]=4 /\
        board[i-1,j]=4 /\
        board[i-2,j]=4))

  elseif k==5 then %P
     exists(i in 1..m,j in 1..n)(
      (board[i,j]=5 /\
       board[i+1,j]=5 /\
       board[i,j+1]=5 /\
       board[i-1,j]=5 /\
       board[i-1,j+1]=5) \/

      (board[i,j]=5 /\
       board[i,j-1]=5 /\
       board[i+1,j]=5 /\
       board[i,j+1]=5 /\
       board[i+1,j+1]=5) \/

      (board[i,j]=5 /\
       board[i-1,j]=5 /\
       board[i,j-1]=5 /\
       board[i+1,j]=5 /\
       board[i+1,j-1]=5) \/

      (board[i,j]=5 /\
       board[i,j+1]=5 /\
       board[i-1,j]=5 /\
       board[i,j-1]=5 /\
       board[i-1,j-1]=5) \/

      % ---- FLIP ----
    
      (board[i,j]=5 /\
       board[i+1,j]=5 /\
       board[i,j-1]=5 /\
       board[i-1,j]=5 /\
       board[i-1,j-1]=5) \/

      (board[i,j]=5 /\
       board[i,j-1]=5 /\
       board[i-1,j]=5 /\
       board[i,j+1]=5 /\
       board[i-1,j+1]=5) \/

      (board[i,j]=5 /\
       board[i-1,j]=5 /\
       board[i,j+1]=5 /\
       board[i+1,j]=5 /\
       board[i+1,j+1]=5) \/

      (board[i,j]=5 /\
       board[i,j+1]=5 /\
       board[i+1,j]=5 /\
       board[i,j-1]=5 /\
       board[i+1,j-1]=5))

  elseif k==6 then %T
     exists(i in 1..m,j in 1..n)(
      (board[i,j]=6 /\
       board[i,j-1]=6 /\
       board[i,j+1]=6 /\
       board[i+1,j]=6 /\
       board[i+2,j]=6) \/

      (board[i,j]=6 /\
       board[i+1,j]=6 /\
       board[i-1,j]=6 /\
       board[i,j-1]=6 /\
       board[i,j-2]=6) \/

      (board[i,j]=6 /\
       board[i,j+1]=6 /\
       board[i,j-1]=6 /\
       board[i-1,j]=6 /\
       board[i-2,j-1]=6) \/

      (board[i,j]=6 /\
       board[i+1,j]=6 /\
       board[i-1,j]=6 /\
       board[i,j+1]=6 /\
       board[i,j+2]=6))

    elseif k==7 then %U
     exists(i in 1..m,j in 1..n)(
      (board[i,j]=7 /\
       board[i,j-1]=7 /\
       board[i-1,j-1]=7 /\
       board[i,j+1]=7 /\
       board[i-1,j+1]=7) \/

      (board[i,j]=7 /\
       board[i+1,j]=7 /\
       board[i+1,j+1]=7 /\
       board[i-1,j]=7 /\
       board[i-1,j+1]=7) \/

      (board[i,j]=7 /\
       board[i,j+1]=7 /\
       board[i+1,j+1]=7 /\
       board[i,j-1]=7 /\
       board[i+1,j-1]=7) \/

      (board[i,j]=7 /\
       board[i-1,j]=7 /\
       board[i-1,j-1]=7 /\
       board[i+1,j]=7 /\
       board[i+1,j-1]=7))

   elseif k==8 then %V
     exists(i in 1..m,j in 1..n)(
      (board[i,j]=8 /\
       board[i,j+1]=8 /\
       board[i,j+2]=8 /\
       board[i+1,j]=8 /\
       board[i+2,j]=8) \/

      (board[i,j]=8 /\
       board[i+1,j]=8 /\
       board[i+2,j]=8 /\
       board[i,j+1]=8 /\
       board[i,j+2]=8) \/

      (board[i,j]=8 /\
       board[i,j-1]=8 /\
       board[i,j-2]=8 /\
       board[i+1,j]=8 /\
       board[i+2,j]=8) \/

      (board[i,j]=8 /\
       board[i,j-1]=8 /\
       board[i,j-2]=8 /\
       board[i+1,j]=8 /\
       board[i+2,j]=8))

     elseif k==9 then %W
      exists(i in 1..m,j in 1..n)(
      (board[i,j]=9 /\
       board[i,j-1]=9 /\
       board[i-1,j-1]=9 /\
       board[i+1,j]=9 /\
       board[i+1,j+1]=9) \/

      (board[i,j]=9 /\
       board[i-1,j]=9 /\
       board[i-1,j+1]=9 /\
       board[i,j-1]=9 /\
       board[i+1,j-1]=9) \/

      (board[i,j]=9 /\
       board[i-1,j]=9 /\
       board[i-1,j-1]=9 /\
       board[i,j+1]=9 /\
       board[i+1,j+1]=9) \/

      (board[i,j]=9 /\
       board[i,j+1]=9 /\
       board[i-1,j+1]=9 /\
       board[i+1,j]=9 /\
       board[i+1,j-1]=9))

  elseif k==10 then %X
     exists(i in 1..m,j in 1..n)(
      (board[i,j]=10 /\
       board[i,j-1]=10 /\
       board[i,j+1]=10 /\
       board[i+1,j]=10 /\
       board[i-1,j]=10))

    elseif k==11 then %Y
     exists(i in 1..m,j in 1..n)(
      (board[i,j]=11 /\
       board[i,j+1]=11 /\
       board[i-1,j]=11 /\
       board[i+1,j]=11 /\
       board[i+2,j]=11) \/

      (board[i,j]=11 /\
       board[i+1,j]=11 /\
       board[i,j+1]=11 /\
       board[i,j-1]=11 /\
       board[i,j-2]=11) \/

      (board[i,j]=11 /\
       board[i,j-1]=11 /\
       board[i+1,j]=11 /\
       board[i-1,j]=11 /\
       board[i-2,j]=11) \/

      (board[i,j]=11 /\
       board[i,j-1]=11 /\
       board[i-1,j]=11 /\
       board[i,j+1]=11 /\
       board[i,j+2]=11) \/

      % ---- FLIP ----

      (board[i,j]=11 /\
       board[i,j-1]=11 /\
       board[i-1,j]=11 /\
       board[i+1,j]=11 /\
       board[i+2,j]=11) \/

      (board[i,j]=11 /\
       board[i-1,j]=11 /\
       board[i,j+1]=11 /\
       board[i,j-1]=11 /\
       board[i,j-2]=11) \/

      (board[i,j]=11 /\
       board[i,j+1]=11 /\
       board[i+1,j]=11 /\
       board[i-1,j]=11 /\
       board[i-2,j]=11) \/

      (board[i,j]=11 /\
       board[i,j-1]=11 /\
       board[i+1,j]=11 /\
       board[i,j+1]=11 /\
       board[i,j+2]=11))

    elseif k==12 then %Z
     exists(i in 1..m,j in 1..n)(
      (board[i,j]=12 /\
       board[i-1,j]=12 /\
       board[i-1,j-1]=12 /\
       board[i+1,j]=12 /\
       board[i+1,j+1]=12) \/

      (board[i,j]=12 /\
       board[i,j-1]=12 /\
       board[i+1,j-1]=12 /\
       board[i,j+1]=12 /\
       board[i-1,j+1]=12) \/

      (board[i,j]=12 /\
       board[i-1,j]=12 /\
       board[i-1,j+1]=12 /\
       board[i+1,j]=12 /\
       board[i+1,j-1]=12) \/

      (board[i,j]=12 /\
       board[i,j-1]=12 /\
       board[i-1,j-1]=12 /\
       board[i,j+1]=12 /\
       board[i+1,j+1]=12))
  else true endif
  );

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