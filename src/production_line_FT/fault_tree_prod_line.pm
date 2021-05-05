ctmc

const max_t1 = 20;
const max_t2 = 20;
const max_t3 = 20;
const max_t4 = 20;
const max_t5 = 20;
const max_t6 = 20;
const max_t7 = 20;
const max_tf = 20;
const marge = 5;

global t1: [0..max_t1+marge] init 0;
global t2: [0..max_t2+marge] init 0;
global t3: [0..max_t3+marge] init 0;
global t4: [0..max_t4+marge] init 0;
global t5: [0..max_t5+marge] init 0;
global t6: [0..max_t6+marge] init 0;
global t7: [0..max_t7+marge] init 0;
global tf: [0..max_tf+marge] init 0;

global or1 : [0..2] init 0;
global or2 : [0..2] init 0;
global or3 : [0..2] init 0;

global a_or1 : [0..1] init 0;
global b_or1 : [0..1] init 0;
global c_or1 : [0..1] init 0;

global m1 : [0..1] init 0;
global p1 : [0..3] init 0;
global v1 : [0..1] init 0;

global a_or2 : [0..1] init 0;
global b_or2 : [0..1] init 0;
global c_or2 : [0..1] init 0;

global m2 : [0..1] init 0;
global p2 : [0..3] init 0;
global v2 : [0..1] init 0;

global a_or3 : [0..1] init 0;
global b_or3 : [0..1] init 0;
global c_or3 : [0..1] init 0;

global m3 : [0..1] init 0;
global p3 : [0..3] init 0;
global v3 : [0..1] init 0;

global or4 : [0..2] init 0;
global or5 : [0..2] init 0;
global or6 : [0..2] init 0;

global a_or4 : [0..1] init 0;
global b_or4 : [0..1] init 0;
global c_or4 : [0..1] init 0;

global m4 : [0..1] init 0;
global p4 : [0..3] init 0;
global v4 : [0..1] init 0;

global a_or5 : [0..1] init 0;
global b_or5 : [0..1] init 0;
global c_or5 : [0..1] init 0;

global m5 : [0..1] init 0;
global p5 : [0..3] init 0;
global v5 : [0..1] init 0;

global a_or6 : [0..1] init 0;
global b_or6 : [0..1] init 0;
global c_or6 : [0..1] init 0;

global m6 : [0..1] init 0;
global p6 : [0..3] init 0;
global v6 : [0..1] init 0;

global or7 : [0..2] init 0;
global or8 : [0..2] init 0;

global a_or7 : [0..1] init 0;
global b_or7 : [0..1] init 0;
global c_or7 : [0..1] init 0;

global m7 : [0..1] init 0;
global p7 : [0..3] init 0;
global v7 : [0..1] init 0;

global a_or8 : [0..1] init 0;
global b_or8 : [0..1] init 0;
global c_or8 : [0..1] init 0;

global m8 : [0..1] init 0;
global p8 : [0..3] init 0;
global v8 : [0..1] init 0;

global tle: [0..1] init 0;

module tree
    [] or1=0 -> (or1'=1);
    [] (v1=1) & (v2=0) & (or2=0) -> (or2'=1);
    [] (v1=1) & (v2=1) & (c_or1=1) -> (a_or3'=1) & (v1'=0);
    [] (v1=1) & (v2=1) & (c_or2=1) -> (b_or3'=1) & (v2'=0);

    [] v3=1 & (or4=0) & (v6=0) -> (or4'=1);
    [] v3=1 & (v6=1) & (or7=0) -> (or7'=1);

    [] (v4=1) & (v5=0) & (or5=0) -> (or5'=1);
    [] (v4=1) & (v5=1) & (c_or4=1) -> (a_or6'=1) & (v4'=0);
    [] (v4=1) & (v5=1) & (c_or5=1) -> (b_or6'=1) & (v5'=0);

    [] (v6=1) & (v7=1) & (c_or6=1) -> (a_or8'=1) & (v6'=0);
    [] (v6=1) & (v7=1) & (c_or7=1) -> (b_or8'=1) & (v7'=0);

    [] (c_or8=1) -> (tle'=1);
endmodule

module or_gate1
    [] (or1=1) & (a_or1=0) & (b_or1=0) & (c_or1=0) & (m1=0) & (p1=0) -> 0.32: (a_or1'=1) & (or1'=2) + 0.05: (b_or1'=1) & (or1'=2) + 0.63: (or1'=1);
    [] (a_or1=1) & (or1=2) & (c_or1=0) & (p1=0) & (m1=0) & (t1<max_t1) -> 0.1: (m1'=1) & (t1'=t1+2) & (a_or1'=0) + 0.9: (p1'=1);
    [] (b_or1=1) & (or1=2) & (c_or1=0) & (p1=0) & (m1=0) & (t1<max_t1) -> 0.1: (m1'=1) & (t1'=t1+2) & (b_or1'=0) + 0.9: (p1'=1);

    [] (m1=1) -> (or1'=1) & (a_or1'=0) & (b_or1'=0) & (c_or1'=0) & (m1'=0) & (p1'=0);

    [] (p1=1) & (a_or1=1) & (c_or1=0) & (t1<max_t1) -> (c_or1'=1) & (v1'=1) & (t1'=t1+2);
    [] (p1=1) & (b_or1=1) & (c_or1=0) & (t1<max_t1) -> (c_or1'=1) & (v1'=1) & (t1'=t1+2);
endmodule

module or_gate2
    [] (or2=1) & (a_or2=0) & (b_or2=0) & (c_or2=0) & (m2=0) & (p2=0) -> 0.15: (a_or2'=1) & (or2'=2) + 0.20: (b_or2'=1) & (or2'=2) + 0.65: (or2'=1);
    [] (a_or2=1) & (or2=2) & (c_or2=0) & (p2=0) & (m2=0) & (t2<max_t2) -> 0.1: (m2'=1) & (t2'=t2+1) & (a_or2'=0) + 0.9: (p2'=1);
    [] (b_or2=1) & (or2=2) & (c_or2=0) & (p2=0) & (m2=0) & (t2<max_t2) -> 0.1: (m2'=1) & (t2'=t2+1) & (b_or2'=0) + 0.9: (p2'=1);

    [] (m2=1) -> (or2'=1) & (a_or2'=0) & (b_or2'=0) & (c_or2'=0) & (m2'=0) & (p2'=0);

    [] (p2=1) & (a_or2=1) & (c_or2=0) & (t2<max_t2) -> (c_or2'=1) & (v2'=1) & (t2'=t2+1);
    [] (p2=1) & (b_or2=1) & (c_or2=0) & (t2<max_t2) -> (c_or2'=1) & (v2'=1) & (t2'=t2+1);
endmodule

module or_gate3_mask
    [] (a_or3=1) & (c_or3=0) & (p3=0) & (m3=0) & (v2=1) & (t3<max_t3) -> 0.1: (m3'=1) & (t3'=max(t1,t2)+1) & (a_or3'=0) + 0.9: (a_or3'=1);
    [] (b_or3=1) & (c_or3=0) & (p3=0) & (m3=0) & (v1=1) & (t3<max_t3) -> 0.1: (m3'=1) & (t3'=max(t1,t2)+1) & (b_or3'=0) + 0.9: (b_or3'=1);

    [] (m3=1) -> (or1'=1) & (a_or1'=0) & (b_or1'=0) & (c_or1'=0) & (m1'=0) & (p1'=0) & (v1'=0)
    & (or2'=0) & (a_or2'=0) & (b_or2'=0) & (c_or2'=0) & (m2'=0) & (p2'=0) & (v2'=0)
    & (or3'=0) & (a_or3'=0) & (b_or3'=0) & (c_or3'=0) & (m3'=0) & (p3'=0) & (v3'=0)
    & (t1'=t3) & (t2'=t3);
endmodule

module or_gate3_propa
    [] (a_or3=1) & (c_or3=0) & (p3=0) & (m3=0) & (v2=1) & (t3<max_t3) -> 0.1: (a_or3'=1) + 0.9: (p3'=1) & (t3'=max(t1,t2)+1);
    [] (b_or3=1) & (c_or3=0) & (p3=0) & (m3=0) & (v1=1) & (t3<max_t3) -> 0.1: (b_or3'=1) + 0.9: (p3'=1) & (t3'=max(t1,t2)+1);

    [] (p3=1) & (a_or3=1) & (c_or3=0) & (t3<max_t3) -> (c_or3'=1) & (v3'=1);
    [] (p3=1) & (b_or3=1) & (c_or3=0) & (t3<max_t3) -> (c_or3'=1) & (v3'=1);
endmodule

module or_gate4
    [] (or4=1) & (a_or4=0) & (b_or4=0) & (c_or4=0) & (m4=0) & (p4=0) -> 0.32: (a_or4'=1) & (or4'=2) + 0.05: (b_or4'=1) & (or4'=2) + 0.63: (or4'=1);
    [] (a_or4=1) & (or4=2) & (c_or4=0) & (p4=0) & (m4=0) & (t4<max_t4) -> 0.1: (m4'=1) & (t4'=t4+2) & (a_or4'=0) + 0.9: (p4'=1);
    [] (b_or4=1) & (or4=2) & (c_or4=0) & (p4=0) & (m4=0) & (t4<max_t4) -> 0.1: (m4'=1) & (t4'=t4+2) & (b_or4'=0) + 0.9: (p4'=1);

    [] (m4=1) -> (or4'=1) & (a_or4'=0) & (b_or4'=0) & (c_or4'=0) & (m4'=0) & (p4'=0);

    [] (p4=1) & (a_or4=1) & (c_or4=0) & (t4<max_t4) -> (c_or4'=1) & (v4'=1) & (t4'=t4+2);
    [] (p4=1) & (b_or4=1) & (c_or4=0) & (t4<max_t4) -> (c_or4'=1) & (v4'=1) & (t4'=t4+2);
endmodule

module or_gate5
    [] (or5=1) & (a_or5=0) & (b_or5=0) & (c_or5=0) & (m5=0) & (p5=0) -> 0.10: (a_or5'=1) & (or5'=2) + 0.05: (b_or5'=1) & (or5'=2) + 0.85: (or5'=1);
    [] (a_or5=1) & (or5=2) & (c_or5=0) & (p5=0) & (m5=0) & (t5<max_t5) -> 0.1: (m5'=1) & (t5'=t5+3) & (a_or5'=0) + 0.9: (p5'=1);
    [] (b_or5=1) & (or5=2) & (c_or5=0) & (p5=0) & (m5=0) & (t5<max_t5) -> 0.1: (m5'=1) & (t5'=t5+3) & (b_or5'=0) + 0.9: (p5'=1);

    [] (m5=1) -> (or5'=1) & (a_or5'=0) & (b_or5'=0) & (c_or5'=0) & (m5'=0) & (p5'=0);

    [] (p5=1) & (a_or5=1) & (c_or5=0) & (t5<max_t3) -> (c_or5'=1) & (v5'=1) & (t5'=t5+3);
    [] (p5=1) & (b_or5=1) & (c_or5=0) & (t5<max_t3) -> (c_or5'=1) & (v5'=1) & (t5'=t5+3);
endmodule

module or_gate6_mask
    [] (a_or6=1) & (c_or6=0) & (p6=0) & (m6=0) & (v5=1) & (t6<max_t6) -> 0.1: (m6'=1) & (t6'=max(t4,t5)+2) & (a_or6'=0) + 0.9: (a_or6'=1);
    [] (b_or6=1) & (c_or6=0) & (p6=0) & (m6=0) & (v4=1) & (t6<max_t6) -> 0.1: (m6'=1) & (t6'=max(t4,t5)+2) & (b_or6'=0) + 0.9: (b_or6'=1);

    [] (m6=1) -> (or4'=1) & (a_or4'=0) & (b_or4'=0) & (c_or4'=0) & (m4'=0) & (p4'=0) & (v4'=0)
    & (or5'=0) & (a_or5'=0) & (b_or5'=0) & (c_or5'=0) & (m5'=0) & (p5'=0) & (v5'=0)
    & (or6'=0) & (a_or6'=0) & (b_or6'=0) & (c_or6'=0) & (m6'=0) & (p6'=0) & (v6'=0)
    & (t4'=t6) & (t5'=t6);
endmodule

module or_gate6_propa
    [] (a_or6=1) & (c_or6=0) & (p6=0) & (m6=0) & (v5=1) & (t6<max_t6) -> 0.1: (a_or6'=1) + 0.9: (p6'=1) & (t6'=max(t4,t5)+2);
    [] (b_or6=1) & (c_or6=0) & (p6=0) & (m6=0) & (v4=1) & (t6<max_t6) -> 0.1: (b_or6'=1) + 0.9: (p6'=1) & (t6'=max(t4,t5)+2);

    [] (p6=1) & (a_or6=1) & (c_or6=0) & (t6<max_t6) -> (c_or6'=1) & (v6'=1);
    [] (p6=1) & (b_or6=1) & (c_or6=0) & (t6<max_t6) -> (c_or6'=1) & (v6'=1);
endmodule

module or_gate7_mask
    [] (or7=1) & (c_or3=1) & (b_or7=0) & (c_or7=0) & (m7=0) & (p7=0) -> (a_or7'=1) & (or7'=2);
    [] (or7=1) & (c_or3=1) & (b_or7=0) & (c_or7=0) & (m7=0) & (p7=0) -> 0.25: (b_or7'=1) & (or7'=2) + 0.75: (or7'=1);
    [] (a_or7=1) & (or7=2) & (c_or7=0) & (p7=0) & (m7=0) & (t7<max_t7) -> 0.1: (m7'=1) & (t7'=t3+1) & (a_or7'=0) + 0.9: (a_or7'=1);
    [] (b_or7=1) & (or7=2) & (c_or7=0) & (p7=0) & (m7=0) & (t7<max_t7) -> 0.1: (m7'=1) & (t7'=t3+1) & (b_or7'=0) + 0.9: (b_or7'=1);

    [] (m7=1) -> (or7'=0) & (a_or7'=0) & (b_or7'=0) & (c_or7'=0) & (m7'=0) & (p7'=0) & (v7'=0)
    & (or3'=0) & (a_or3'=0) & (b_or3'=0) & (c_or3'=0) & (m3'=0) & (p3'=0) & (v3'=0)
    & (or2'=0) & (a_or2'=0) & (b_or2'=0) & (c_or2'=0) & (m2'=0) & (p2'=0) & (v2'=0)
    & (or1'=1) & (a_or1'=0) & (b_or1'=0) & (c_or1'=0) & (m1'=0) & (p1'=0) & (v1'=0)
    & (t1'=t7) & (t2'=t7);
endmodule

module or_gate7_propa
    [] (a_or7=1) & (or7=2) & (c_or7=0) & (p7=0) & (m7=0) & (t7<max_t7) -> 0.1: (a_or7'=1) + 0.9: (p7'=1) & (t7'=t3+1);
    [] (b_or7=1) & (or7=2) & (c_or7=0) & (p7=0) & (m7=0) & (t7<max_t7) -> 0.1: (b_or7'=1) + 0.9: (p7'=1) & (t7'=t3+1);

    [] (p7=1) & (a_or7=1) & (c_or7=0) & (t7<max_t7) -> (c_or7'=1) & (v7'=1);
    [] (p7=1) & (b_or7=1) & (c_or7=0) & (t7<max_t7) -> (c_or7'=1) & (v7'=1);
endmodule


module or_gate8_mask
    [] (a_or8=1) & (c_or8=0) & (p8=0) & (m8=0) & (v7=1) & (tf<max_tf) -> 0.1: (m8'=1) & (tf'=max(t6,t7)+2) & (a_or8'=0) + 0.9: (a_or8'=1);
    [] (b_or8=1) & (c_or8=0) & (p8=0) & (m8=0) & (v6=1) & (tf<max_tf) -> 0.1: (m8'=1) & (tf'=max(t6,t7)+2) & (b_or8'=0) + 0.9: (b_or8'=1);

    [] (m8=1) -> (or1'=1) & (a_or1'=0) & (b_or1'=0) & (c_or1'=0) & (m1'=0) & (p1'=0) & (v1'=0)
    & (or2'=0) & (a_or2'=0) & (b_or2'=0) & (c_or2'=0) & (m2'=0) & (p2'=0) & (v2'=0)
    & (or3'=0) & (a_or3'=0) & (b_or3'=0) & (c_or3'=0) & (m3'=0) & (p3'=0) & (v3'=0)
    & (or4'=0) & (a_or4'=0) & (b_or4'=0) & (c_or4'=0) & (m4'=0) & (p4'=0) & (v4'=0)
    & (or5'=0) & (a_or5'=0) & (b_or5'=0) & (c_or5'=0) & (m5'=0) & (p5'=0) & (v5'=0)
    & (or6'=0) & (a_or6'=0) & (b_or6'=0) & (c_or6'=0) & (m6'=0) & (p6'=0) & (v6'=0)
    & (or7'=0) & (a_or7'=0) & (b_or7'=0) & (c_or7'=0) & (m7'=0) & (p7'=0) & (v7'=0)
    & (or8'=0) & (a_or8'=0) & (b_or8'=0) & (c_or8'=0) & (m8'=0) & (p8'=0) & (v8'=0)
    & (t1'=tf) & (t2'=tf) & (t4'=tf) & (t5'=tf);
endmodule

module or_gate8_propa
    [] (a_or8=1) & (c_or8=0) & (p8=0) & (m8=0) & (v7=1) & (tf<max_tf) -> 0.1: (a_or8'=1) + 0.9: (p8'=1) & (tf'=max(t6,t7)+2);
    [] (b_or8=1) & (c_or8=0) & (p8=0) & (m8=0) & (v6=1) & (tf<max_tf) -> 0.1: (b_or8'=1) + 0.9: (p8'=1) & (tf'=max(t6,t7)+2);

    [] (p8=1) & (a_or8=1) & (c_or8=0) & (tf<max_tf) -> (c_or8'=1) & (v8'=1);
    [] (p8=1) & (b_or8=1) & (c_or8=0) & (tf<max_tf) -> (c_or8'=1) & (v8'=1);
endmodule
