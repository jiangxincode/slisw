% 农夫问题求解
% 使用一个1×4的波尔向量来表示狼，羊，菜，农夫的状态
% 第一个元素代表狼，第二个羊，第三个菜，第四个农夫。
% 元素等于0时表示对应的对象在彼岸，等于1时，表示对应的对象在此岸。
% 调用方法 across([1,1,1,1], [], Result).

v(0). %在彼岸
v(1). %在此岸

move(OldState, NewState) :-
    [A1, B1, C1, D1] = OldState,
    v(A1), v(B1), v(C1), v(D1),
    D1 == 1, % 农夫在此岸
    [A2, B2, C2, D2] = NewState,
    v(A2), v(B2), v(C2), v(D2),
    D2 == 0, % 农夫在彼岸
    A2+B2 =\= 2, % 狼和羊不能都留在此岸
    B2+C2 =\= 2, % 羊和菜不能都留在此岸
    A1-A2 >= 0, % 狼可以在此岸也可以去彼岸
    B1-B2 >= 0, % 羊可以在此岸也可以去彼岸
    C1-C2 >= 0, % 菜可以在此岸也可以去彼岸
    sum_list(OldState, OldSum), % 预置函数，列表求和
    sum_list(NewState, NewSum),
    NewSum =:= OldSum-2.

move(OldState, NewState) :-
    [A1, B1, C1, D1] = OldState,
    v(A1), v(B1), v(C1), v(D1),
    D1 == 0, % 农夫在彼岸
    [A2, B2, C2, D2] = NewState,
    v(A2), v(B2), v(C2), v(D2),
    D2 == 1, % 农夫在此岸
    A2+B2 =\= 0, % 狼和羊不能都留在彼岸
    B2+C2 =\= 0, % 羊和菜不能都留在彼岸
    A1-A2 =< 0, % 狼可以在彼岸也可以来此岸
    B1-B2 =< 0, % 羊可以在彼岸也可以来此岸
    C1-C2 =< 0, % 菜可以在彼岸也可以来此岸
    sum_list(OldState, OldSum),
    sum_list(NewState, NewSum),
    NewSum >= OldSum+1,
    NewSum =< OldSum+2.

across([0, 0, 0, 0], Visited, Result) :-
    Result = [[0, 0, 0, 0]].

across(OldState, Visited, Result) :-
    move(OldState, NewState),
    \+member(NewState, Visited), % 预置函数，判断前者是否是后者成员
    across(NewState, [NewState|Visited], NewResult),
    Result = [OldState|NewResult].
