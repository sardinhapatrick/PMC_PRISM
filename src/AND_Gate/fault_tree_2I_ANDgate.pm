dtmc

global and : [0..2] init 0;
global a : [0..1] init 0;
global b : [0..1] init 0;
global m : [0..1] init 0;
global p : [0..1] init 0;
global tle: [0..1] init 0;

module tree
    [] and=0 -> (and'=1);
endmodule

module and_gate
    [] (and=1) & (a=0) & (b=0) & (m=0) & (p=0) -> 0.4: (a'=1) & (and'=2) + 0.1: (b'=1) & (and'=2) + 0.5: (and'=1);
    [] (a=1) & (b=0) & (and=2) & (m=0) & (p=0) -> 0.1: (m'=1) & (a'=0) + 0.1: (p'=1) & (b'=1) + 0.8: (and'=1);
    [] (b=1) & (a=0) & (and=2) & (m=0) & (p=0) -> 0.1: (m'=1) & (b'=0) + 0.4: (p'=1) & (a'=1) + 0.5: (and'=1);
    [] (a=1) & (b=1) & (p=1) -> (tle'=1);
endmodule
