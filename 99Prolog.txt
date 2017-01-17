%my_last([],[]).
%my_last(X,[X]).
%my_last(X,[_|L]) :- my_last(X,L).

%last_but_one(X,[X,_]).
%last_but_one(X,[_|H]):- last_but_one(X,H).

%element_at(X,[A|_],1) :- X is A .
%element_at(X,[_|H],Y) :- Y1 is Y-1, element_at(X,H,Y1).

%length_lst(X,[],L) :- X is L.
%length_lst(X,[_|H],L) :- L1 is L + 1 , length_lst(X,H,L1).
%len(X,LIST) :- length_lst(X,LIST,0).


%rev(X,[],R) :- X = R.
%rev(X,[H|T],R) :- rev(X,T ,[H|R]).
%my_reverse(X,L) :- rev(X,L,[]).



%compare_lst([],[]) :- true.
%compare_lst([H1|T1],[H2|T2]) :- H1=:=H2 ->  compare_lst(T1,T2); false.
%palindrome(L) :-my_reverse(X,L),compare_lst(L,X).

%flatten_lst([],R) :- R = [].
%flatten_lst([H|T],R) :-
%    flatten_lst(H,NewH),
%    flatten_lst(T,NewT),
%    append(NewH,NewT,R).
%flatten_lst(R,[R]).

    
%compress([],[]).
%compress([X],[X]).
%compress([X,X|T],R) :- compress([X|T],R).
%compress([X,Y|T1],[X|T2]) :- compress([Y|T1],T2).


%pack([],[]).
%pack([X|Xs],[Z|Zs]) :- transfer(X,Xs,Ys,Z), pack(Ys,Zs).




%transfer(X,[],[],[X]).
%transfer(X,[Y|Ys],[Y|Ys],[X]) :- X \= Y.
%transfer(X,[X|Xs],Ys,[X|Zs]) :- transfer(X,Xs,Ys,Zs).



dupli([],[]).
dupli([X],[X,X]).
dupli([A|T],[A,A|T2]) :- dupli(T,T2).

dupli_helper(L,L,0).
dupli_helper([A|T],X,Times) :-Times2 is Times - 1, dupli_helper([A|T],[A|X],Times2).  





