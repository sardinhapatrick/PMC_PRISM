mdp

global or : [0..2] init 0;
global and : [0..2] init 0;

global a_or1 : [0..1] init 0;
global b_or1 : [0..1] init 0;
global c_or1 : [0..1] init 0;

global a_and1 : [0..1] init 0;
global b_and1 : [0..1] init 0;
global c_and1 : [0..1] init 0;

global m : [0..1] init 0;
global p : [0..1] init 0;

global tle: [0..1] init 0;

module tree
    [] or=0 -> (or'=1);
    [] c_or1=1 -> (a_and1'=1);
    [] c_and1=1 -> (tle'=1);
endmodule

module or_gate
    [] (or=1) & (a_or1=0) & (b_or1=0) & (m=0) & (p=0) -> 0.2: (a_or1'=1) & (or'=2) + 0.1: (b_or1'=1) & (or'=2) + 0.7: (or'=1);
    [] (a_or1=1) & (p=0) & (m=0) -> 0.1: (m'=1) & (a_or1'=0) + 0.9: (p'=1) & (a_or1'=1);
    [] (b_or1=1) & (p=0) & (m=0) -> 0.1: (m'=1) & (b_or1'=0) + 0.9: (p'=1) & (b_or1'=1);
    [] (p=1) -> (p'=0) & (c_or1'=1);
endmodule

module and_gate
    [] (a_and1=1) & (b_and1=0) & (m=0) & (p=0) -> 0.1: (m'=1) & (a_and1'=0) + 0.1: (p'=1) & (b_and1'=1) + 0.8: (and'=1);
    [] (b_and1=1) & (a_and1=1) & (m=0) & (p=0) -> 0.1: (m'=1) & (b_and1'=0) & (a_and1'=0) + 0.4: (p'=1) + 0.5: (and'=1);
    [] (a_and1=1) & (b_and1=1) & (p=1) -> (c_and1'=1);
endmodule
