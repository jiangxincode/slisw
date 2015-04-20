% 爱因斯坦逻辑难题

% 题目：5个不同国家且工作各不相同的人分别住在一条街上的5所房子里，每所房子的颜色不同，每个人都有自己养的不同宠物，喜欢喝不同的饮料。根据以下提示，你能告诉我哪所房子里的人养斑马，哪所房子里的人喜欢喝矿泉水吗？

% 英国人住在红色的房子里
% 西班牙人养了一条狗
% 日本人是一个油漆工
% 意大利人喜欢喝茶
% 挪威人住在左边的第一个房子里
% 绿房子在白房子的右边
% 摄影师养了一只蜗牛
% 外交官住在黄房子里
% 中间那个房子的人喜欢喝牛奶
% 喜欢喝咖啡的人住在绿房子里
% 挪威人住在蓝色的房子旁边
% 小提琴家喜欢喝橘子汁
% 养狐狸的人所住的房子与医生的房子相邻
% 养马的人所住的房子与外交官的房子相邻

house(A,[A,_,_,_,_]).
house(A,[_,A,_,_,_]).
house(A,[_,_,A,_,_]).
house(A,[_,_,_,A,_]).
house(A,[_,_,_,_,A]).

right(A,B,[A,B,_,_,_]).
right(A,B,[_,A,B,_,_]).
right(A,B,[_,_,A,B,_]).
right(A,B,[_,_,_,A,B]).

middle(A,[_,_,A,_,_]).

first(A,[A,_,_,_,_]).

neighbor(A,B,[A,B,_,_,_]).
neighbor(A,B,[_,A,B,_,_]).
neighbor(A,B,[_,_,A,B,_]).
neighbor(A,B,[_,_,_,A,B]).
neighbor(A,B,[B,A,_,_,_]).
neighbor(A,B,[_,B,A,_,_]).
neighbor(A,B,[_,_,B,A,_]).
neighbor(A,B,[_,_,_,B,A]).

attr(Country,Pet,Color,Drink,Work).

all_houses(Houses) :-
	house(attr(britsh,_,red,_,_), Houses),
	house(attr(spain,dog,_,_,_), Houses),
	house(attr(japan,_,_,_,painter), Houses),
	house(attr(italy,_,_,tea,_), Houses),
	house(attr(norway,_,_,_,_), Houses),
	first(attr(norway,_,_,_,_), Houses),
	right(attr(_,_,white,_,_), attr(_,_,green,_,_), Houses),
	house(attr(_,snail,_,_,photographer), Houses),
	house(attr(_,_,yellow,_,diplomat), Houses),
	middle(attr(_,_,_,milk,_), Houses),
	house(attr(_,_,green,cafe,_), Houses),
	neighbor(attr(norway,_,_,_,_), attr(_,_,blue,_,_), Houses),
	house(attr(_,_,_,orange,violinst), Houses),
	neighbor(attr(_,fox,_,_,_), attr(_,_,_,_,doctor), Houses),
	neighbor(attr(_,horse,_,_,_), attr(_,_,_,_,diplomat), Houses),

	house(attr(_,zebra,_,_,_), Houses),
	house(attr(_,_,_,water,_), Houses).
