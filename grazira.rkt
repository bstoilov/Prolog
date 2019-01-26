%X,Y spisuci ot spisuci
% Neka A e ot X, B e ot Y
% A grazira B ako nqkoi element na B deli vsichki
% elementi na A bez ostatuk
% Da se napishe predikat koito proverqva
% dali vseki element na X se grazira v Y

%true ako X deli vseki element na Y bez ost
grez_single(X,[Y]):- R is mod(Y,X), R = 0.
grez_single(X,[Y|T]) :- R is  mod(Y,X),R = 0,grez_single(X,T).

grez_single_not(X,L) :- not(grez_single(X,L)).

%grezira_not(A,B) -> ako A ne grezira B
grezira_not([Y],B):-grez_single_not(Y,B).
grezira_not([H|T],B) :- grez_single_not(H,B),grezira_not(T,B).

%grezira([9,15,12],[7,3,5]) -> true.
grezira(A,B) :- not(grezira_not(B,A)).

%grez_list(X,Y) -> true ako Vseki element na X
%grazira vsichki elementi ot Y
grez_list(X,[H]) :-grezira(X,H).
grez_list(X,[H|T]) :-grezira(X,H),grez_list(X,T).

%grez_all(X,Y), true ako vseki element na vseki pod spisuk na
%X grezira vseki pod spisuk na Y
grez_all([X],Y) :- grez_list(X,Y).
grez_all([H|T],Y) :- grez_list(H,Y),grez_all(T,Y). 