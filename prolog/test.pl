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
