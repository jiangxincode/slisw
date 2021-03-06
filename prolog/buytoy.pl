% 有六个小朋友去玩具店里买玩具。
% 他们分别带了14元、17元、18元、21元、25元、37元。
% 到了玩具店。他们都看中了一款游戏机。
% 一看定价，这六个人都发现自己所带的钱不够。
% 但是其中有3个人的钱凑在一起正好可以买两台。
% 除去这三个人，有两个人的钱凑在一起恰好能买一台。
% 那么这款游戏机的价格是多少呢？
% 

money(14).
money(17).
money(18).
money(21).
money(25).
money(37).

solve :- 
    money(A),       
    money(B),
    money(C),
    money(D),
    money(E),
    A=\=B,
    A=\=C,
    A=\=D,
    A=\=E,
    B=\=C,
    B=\=D,
    B=\=E,
    C=\=D,
    C=\=E,
    D=\=E,
    X is D+E,
    2*X=:=A+B+C,
    write(X).
