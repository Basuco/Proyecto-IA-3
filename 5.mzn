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

constraint assert(m>=3 /\ n>=3, "No es posible realizar el cubrimiento con las dimensiones proporsionadas\n");
%constraint assert(m*n >= 60, "No es posible realizar el cubrimiento con las dimensiones proporsionadas\n");

set of int: dom = 1..12;
array[1..m,1..n] of var dom: board;

%F
constraint exists(i in 1..m,j in 1..n)(
        (board[i,j]=1 /\
        board[i+1,j]=1 /\
        board[i-1,j]=1 /\
        ((board[i,j-1]=1 /\        
        board[i-1,j+1]=1)\/
        (board[i,j+1]=1 /\        
        board[i-1,j-1]=1))) \/

        (board[i,j]=1 /\
        board[i,j-1]=1 /\
       board[i,j+1]=1 /\
        ((board[i-1,j]=1 /\
        board[i+1,j+1]=1) \/
         (board[i+1,j]=1 /\
        board[i-1,j+1]=1))) \/

        (board[i,j]=1 /\
        board[i-1,j]=1 /\
        board[i+1,j]=1 /\
        ((board[i,j+1]=1 /\
        board[i+1,j-1]=1) \/
         (board[i,j-1]=1 /\
        board[i+1,j+1]=1))) \/

        (board[i,j]=1 /\
        board[i,j+1]=1 /\
       board[i,j-1]=1 /\
        ((board[i+1,j]=1 /\
        board[i-1,j-1]=1) \/
        (board[i-1,j]=1 /\
        board[i+1,j-1]=1))));

% I
constraint exists(i in 1..m,j in 1..n)(
        (board[i,j]=2 /\
        board[i+1,j]=2 /\
        board[i+2,j]=2 /\
        board[i-1,j]=2 /\
        board[i-2,j]=2) \/
        
        (board[i,j]=2 /\
        board[i,j+1]=2 /\
        board[i,j+2]=2 /\
        board[i,j-1]=2 /\
        board[i,j-2]=2));

% L
constraint exists(i in 1..m,j in 1..n)(
        (board[i,j]=3 /\
        board[i-1,j]=3 /\
        board[i-2,j]=3 /\
        board[i+1,j]=3 /\
        (board[i+1,j+1]=3 \/ board[i+1,j-1]=3)) \/
        
        (board[i,j]=3 /\
        board[i,j+1]=3 /\
        board[i,j+2]=3 /\
        board[i,j-1]=3 /\
        (board[i+1,j-1]=3 \/ board[i-1,j-1]=3)) \/

       (board[i,j]=3 /\
        board[i-1,j]=3 /\
        (board[i-1,j-1]=3 \/ board[i-1,j+1]=3) /\
        board[i+1,j]=3 /\
        board[i+2,j]=3) \/
      
        (board[i,j]=3 /\
        board[i,j+1]=3 /\
        (board[i-1,j+1]=3 \/ board[i+1,j+1]=3) /\
        board[i,j-1]=3 /\
        board[i,j-2]=3));

% N
constraint exists(i in 1..m,j in 1..n)(
        (board[i,j]=4 /\
        ((board[i-1,j]=4 /\
        board[i-1,j-1]=4) \/
        (board[i+1,j]=4 /\
        board[i+1,j-1]=4)) /\
        board[i,j+1]=4 /\
        board[i,j+2]=4) \/

        (board[i,j]=4 /\
        ((board[i,j+1]=4 /\
        board[i-1,j+1]=4) \/
        (board[i,j-1]=4 /\
        board[i-1,j-1]=4)) /\
        board[i+1,j]=4 /\
        board[i+2,j]=4) \/

        (board[i,j]=4 /\
        ((board[i+1,j]=4 /\
        board[i+1,j+1]=4) \/
         (board[i-1,j]=4 /\
        board[i-1,j+1]=4)) /\
        board[i,j-1]=4 /\
        board[i,j-2]=4) \/

        (board[i,j]=4 /\
        ((board[i,j-1]=4 /\
        board[i+1,j-1]=4) \/
        (board[i,j+1]=4 /\
        board[i+1,j+1]=4)) /\
        board[i-1,j]=4 /\
        board[i-2,j]=4));

%P
constraint exists(i in 1..m,j in 1..n)(
      (board[i,j]=5 /\
       (board[i+1,j]=5) /\ % \/ board[i+1,j+1]=5
       board[i,j+1]=5 /\
       board[i-1,j]=5 /\
       board[i-1,j+1]=5) \/

      (board[i,j]=5 /\
       (board[i,j-1]=5 ) /\% \/ board[i+1,j-1]=5
       board[i+1,j]=5 /\
       board[i,j+1]=5 /\
       board[i+1,j+1]=5) \/

      (board[i,j]=5 /\
       (board[i-1,j]=5) /\ %  \/ board[i-1,j-1]=5
       board[i,j-1]=5 /\
       board[i+1,j]=5 /\
       board[i+1,j-1]=5) \/

      (board[i,j]=5 /\
       (board[i,j+1]=5 )/\ %\/ board[i-1,j+1]=5
       board[i-1,j]=5 /\
       board[i,j-1]=5 /\
       board[i-1,j-1]=5) \/

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
       board[i+1,j-1]=5));

% T
constraint exists(i in 1..m,j in 1..n)(
      (board[i,j]=6 /\
       board[i,j-1]=6 /\
       board[i,j+1]=6 /\
       ((board[i+1,j]=6 /\
       board[i+2,j]=6) \/
        (board[i-1,j]=6 /\
       board[i-2,j]=6))) \/

      (board[i,j]=6 /\
       board[i+1,j]=6 /\
       board[i-1,j]=6 /\
       ((board[i,j-1]=6 /\
       board[i,j-2]=6) \/
        (board[i,j+1]=6 /\
       board[i,j+2]=6))));

% U
constraint exists(i in 1..m,j in 1..n)(
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
       board[i+1,j-1]=7));

% V
constraint exists(i in 1..m,j in 1..n )(
      (board[i,j]=8 /\
       board[i,j+1]=8 /\
       board[i,j+2]=8 /\
       board[i-1,j]=8 /\
       board[i-2,j]=8) \/

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
       board[i-1,j]=8 /\
       board[i-2,j]=8));

% W
constraint exists(i in 1..m,j in 1..n)(
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
       board[i+1,j-1]=9));

% X
constraint exists(i in 1..m,j in 1..n)(
       board[i,j]=10 /\
       board[i,j-1]=10 /\
       board[i,j+1]=10 /\
       board[i+1,j]=10 /\
       board[i-1,j]=10);


% Y
constraint exists(i in 1..m,j in 1..n)(
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
       board[i,j+2]=11));


% Z
constraint exists(i in 1..m,j in 1..n)(
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
       board[i+1,j+1]=12));

solve satisfy;

output  [ show_int(2,board[i,j]) ++ "  " ++ 
         if j == n then "\n" else "" endif
         | i in 1..m, j in 1..n ] ++ ["\n"];