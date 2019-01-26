my_flatten(X,[X]) :- not(is_list(X)).
my_flatten([],[]).
my_flatten([X|Xs],Zs) :- my_flatten(X,Y), my_flatten(Xs,Ys), append(Y,Ys,Zs).

com([],[]).
com([X],[X]).
com([X,X|T],L) :- com([X|T],L).
com([X,Y|T],[X|T2]) :- com([Y|T],T2).

pack([],[[]]).
pack([X],[[X]]).
pack([X,X|T],[[X|T2]|L]) :- pack([X|T],[T2|L]).
pack([X,Y|T],[[X|[X]]|L]) :- pack([Y|T],L).


encode(L1,L2) :- encode_h(L1,L2,1).
encode_h([X],[[X,1]],1).
encode_h([X],[[S,X]],S).
encode_h([X,X|T],L,S) :- S2 is S + 1,encode_h([X|T],L,S2).
encode_h([X,Y|T],[X|T2],1) :- S2 is 1,encode_h([Y|T],T2,S2).
encode_h([X,Y|T],[[S,X]|T2],S) :- S2 is 1,encode_h([Y|T],T2,S2).


decode([],[]).
decode([[1,X]],[X]).
decode([[1,X]|T],[X|T2]) :- decode(T,T2).
decode([[S,X]|T1],[X|T2]) :-S2 is S -1,decode([[S2,X]|T1],T2).

dupli([],[]).
dupli([X],[X,X]).
dupli([X|T],[X,X|T2]):-dupli(T,T2).

d([],[],_).

d([H],X,N) :- d_h(H,X,N).

d([H1|T],[X|T2],N) :- d_h(H1,X,N),my_flatten(T2,T3), d(T,T3,N).
d_h(X,[X],1).
d_h(X,[X|T],N) :-N2 is N - 1, d_h(X,T,N2).


drop(L1,X,N):-drop_h(L1,X,N,N),!.
drop_h([],[],_,_):-!.
drop_h([_|T1],L,N,1):-drop_h(T1,L,N,N).
drop_h([H1|T1],[H1|T2],N,C):-C2 is C - 1,drop_h(T1,T2,N,C2).


take_first_n([X|_],[X],1):-!.
take_first_n([X|T1],[X|T2],N):-N2 is N - 1,take_first_n(T1,T2,N2).
split(T,L,R,N) :- take_first_n(T,L,N),append(L,R,T).

slice(L,1,E,X) :-split(L,X,_,E),!.
slice(L,S,E,X):-split(L,_,L2,S),E2 is E - S,slice(L2,1,E2,X).

%slice([1,2,3,5,6,4,5,6,7,8,9],4,8,X).





rotate([H|T],X):- append(T,[H],X).




