% 传教士与野人问题
% 有M个传教士和M个野人来到河边准备渡河，河岸有一条船，每次至多可N人乘渡。
% 问传教士为了安全起见，应如何规划摆渡方案，
% 使得任何时刻，在河的两岸以及船上的野人数目总是不超过传教士的数目。
% 思路：假设开始时传教士、野人和船都在右岸
% 用数组(a,b,c)分别表示右岸传教士个数、右岸野人个数、船的位置
% 则可分为三种情况讨论:
% A、N>M/2。此种情况下先把所有的野人度过去,每次返回一个野人,当出现(M,0,0)情况时返回M-N个野人(若M=N,返回1个野人)。然后渡N个传教士,此时野人=传教士.然后返回一个野人和传教士,再开始最大限度的渡传教士,每次返回一个野人,最终直到a=b=c=0
% B、N<=3 && N<=M/2 || N==1 显然此时无解
% C、N>=4 && N<=M/2 此时只能每次传N/2个传教士和野人,每次返回一个野人和传教士,直到最终结果。

move(1,0). % 表示船上有一个传教士没有野人
move(0,1).
move(0,2).
move(2,0).
move(1,1).

% 判断移动后两岸状态是否合法
legal((X,Y,_)) :- %X 为左岸状态， Y为右岸状态， _取0或1，0代表左岸，1代表右岸
    legal1(X),
    legal1(Y).

legal1((X,Y)) :-
    X=:=0,
    Y>=0,
    !.

legal1((X,Y)) :-
    Y=:=0,X>=0,!.
legal1((X,Y)) :-
    X>=Y,X>=0,Y>=0.
update((X,Y,0),Move,Statu1):-
    (A,B)=X,
    (C,D)=Y,
    (E,F)=Move,
    C1 is C+E,
    D1 is D+F,
    A1 is A-E,B1
    is B-F,
    Statu1=((A1,B1),(C1,D1),1).

update((X,Y,1),Move,Statu1):-
    (A,B)=X,
    (C,D)=Y,
    (E,F)=Move,
    C1 is C-E,
    D1 is D-F,
    A1 is A+E,
    B1 is B+F,
    Statu1=((A1,B1),(C1,D1),0).

connect(Statu,Statu1):-
    move(X,Y),
    update(Statu,(X,Y),Statu1),
    legal(Statu1).

findroad(X,X,L,L).
findroad(X,Y,L,L1):-
    connect(X,Z),
    not(member(Z,L)),
    findroad(Z,Y,[Z|L],L1).
