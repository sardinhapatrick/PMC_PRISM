dtmc

global or1 : [0..2] init 0;
global or2 : [0..2] init 0;
global or3 : [0..2] init 0;

global a_or1 : [0..1] init 0;
global b_or1 : [0..1] init 0;
global c_or1 : [0..1] init 0;

global m1 : [0..1] init 0;
global p1 : [0..3] init 0;

global a_or2 : [0..1] init 0;
global b_or2 : [0..1] init 0;
global c_or2 : [0..1] init 0;

global m2 : [0..1] init 0;
global p2 : [0..3] init 0;

global a_or3 : [0..1] init 0;
global b_or3 : [0..1] init 0;
global c_or3 : [0..1] init 0;

global m3 : [0..1] init 0;
global p3 : [0..3] init 0;

global tle: [0..1] init 0;

module tree
    [] or1=0 -> (or1'=1);
    [] c_or1=1 & (p1=2)-> (or2'=1) & (p1'=3);
    [] (c_or1=1) & (or3=1) -> (a_or3'=1) & (or3'=0);
    [] (c_or2=1) & (or3=1) -> (b_or3'=1) & (or3'=0);
    [] c_or3=1 -> (tle'=1);
endmodule

module or_gate1
    [] (or1=1) & (a_or1=0) & (b_or1=0) & (m1=0) & (p1=0) -> 0.2: (a_or1'=1) & (or1'=2) + 0.1: (b_or1'=1) & (or1'=2) + 0.7: (or1'=1);
    [] (a_or1=1) & (p1=0) & (m1=0) -> 0.1: (m1'=1) & (a_or1'=0) + 0.9: (p1'=1) & (a_or1'=1);
    [] (b_or1=1) & (p1=0) & (m1=0) -> 0.1: (m1'=1) & (b_or1'=0) + 0.9: (p1'=1) & (b_or1'=1);
    [] (p1=1) & (a_or1=1) -> (p1'=2) & (c_or1'=1);
    [] (p1=1) & (b_or1=1) -> (p1'=2) & (c_or1'=1);
endmodule

module or_gate2
    [] (or2=1) & (a_or2=0) & (b_or2=0) & (m2=0) & (p2=0) -> 0.2: (a_or2'=1) & (or2'=2) + 0.1: (b_or2'=1) & (or2'=2) + 0.7: (or2'=1);
    [] (a_or2=1) & (p2=0) & (m2=0) -> 0.1: (m2'=1) & (a_or2'=0) + 0.9: (p2'=1) & (a_or2'=1);
    [] (b_or2=1) & (p2=0) & (m2=0) -> 0.1: (m2'=1) & (b_or2'=0) + 0.9: (p2'=1) & (b_or2'=1);
    [] (p2=1) & (a_or2=1) -> (p2'=2) & (c_or2'=1) & (or3'=1);
    [] (p2=1) & (b_or2=1) -> (p2'=2) & (c_or2'=1) & (or3'=1);
endmodule

module or_gate3
    [] (a_or3=1) & (p3=0) & (m3=0) -> 0.1: (m3'=1) & (a_or3'=0) + 0.9: (p3'=1) & (a_or3'=1);
    [] (b_or3=1) & (p3=0) & (m3=0) -> 0.1: (m3'=1) & (b_or3'=0) + 0.9: (p3'=1) & (b_or3'=1);
    [] (p3=1) & (a_or3=1) -> (p3'=2) & (c_or3'=1);
    [] (p3=1) & (b_or3=1) -> (p3'=2) & (c_or3'=1);
endmodule
