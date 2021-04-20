dtmc

global or : [0..2] init 0;
global a : [0..1] init 0;
global b : [0..1] init 0;
global m : [0..1] init 0;
global p : [0..1] init 0;
global tle: [0..1] init 0;

module tree
    [] or=0 -> (or'=1);
endmodule

module or_gate
    [] (or=1) & (a=0) & (b=0) & (m=0) & (p=0) -> 0.2: (a'=1) & (or'=2) + 0.1: (b'=1) & (or'=2) + 0.7: (or'=1);
    [] (a=1) & (p=0) & (m=0) -> 0.1: (m'=1) & (a'=0) + 0.9: (p'=1) & (a'=1);
    [] (b=1) & (p=0) & (m=0) -> 0.1: (m'=1) & (b'=0) + 0.9: (p'=1) & (b'=1);
    [] (p=1) -> (tle'=1);
endmodule
