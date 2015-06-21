include "alldifferent.mzn";

int: nc=9;

var 1..nc: A; 
var 1..nc: B; 
var 1..nc: C; 
var 1..nc: D; 
var 1..nc: E; 
var 1..nc: F; 
var 1..nc: G; 
var 1..nc: H; 
var 1..nc: I; 

constraint alldifferent([A,B,C,D,E,F,G,H,I]);
constraint (A/(B*C)) + (D/(E*F)) + (G/(H*I)) == 1;

solve satisfy;	
