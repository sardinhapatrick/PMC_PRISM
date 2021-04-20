dtmc

global or : [0..2] init 0;
global a : [0..1] init 0;
global b : [0..1] init 0;
global m : [0..1] init 0;
global c : [0..1] init 0;

module tree
    [] or=0 -> (or'=1);
endmodule

module or_gate
    [] (or=1) & (a=0) & (b=0) & (m=0) & (c=0) -> 0.9: (a'=1) & (or'=2) + 0.1: (b'=1) & (or'=2);
    [] (a=1) & (c=0) & (m=0) -> 0.8: (m'=1) & (a'=0) + 0.2: (c'=1) & (a'=0);
    [] (b=1) & (c=0) & (m=0) -> 0.2: (m'=1) & (b'=0) + 0.8: (c'=1) & (b'=0);
    [] (c=1) -> (c'=1);
endmodule
