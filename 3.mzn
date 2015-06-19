include "alldifferent.mzn";

var 0..9: A; var 0..9: B; var 0..9: C;
var 0..9: D; var 0..9: E; var 0..9: F;
var 0..9: G; var 0..9: H; var 0..9: I;
var 0..9: J;
var int: res;
var int: izq = (((((((A*10+B)*10)+C)*10)+D)*10)+E);
var int: der = (((((((F*10+G)*10)+H)*10)+J)*10)+I);
constraint res = izq - der; 
constraint res > 0;
constraint alldifferent([A,B,C,D,E,F,G,H,I,J]);
solve minimize res;

output ["A =", show(A),"\t B =", show(B),
        "\nC =",show(C),"\t D =",show(D),
        "\nE =",show(E),"\t F =",show(F),
        "\nG =",show(G),"\t H =",show(H),
        "\nI =",show(I),"\t J =",show(J),
        "\nABCDE =",show(izq),"\t FGHIJ =",show(der),
        "\nABCDE - FGHIJ = ",show(res)];