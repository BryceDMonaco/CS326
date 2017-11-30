% Bryce Monaco
% CS 326
% HW7

%Just Some Testing
likes(john, flowers).
likes(john, mary).
likes(paul, mary).

%Question 1
%reverse(L, L1)
%For a list consisting of [H|T] I need to concatinate H with the reversed T [reverse(T, X)|H]?
reverse([], []).
reverse([X], [X]).  
reverse([H|T], Y) :- reverse(T,T1), append(T1, [H], Y).

%Question 2
%take(L, N, L1)
take([], _, []). %Case 1: L is empty. No matter the N and no matter the second list, the empty list is contained
take(_, 0, []). %Case 2: N=0
take([H|T], N, [H1|T1]) :- H=H1, take(T, X, T1), N is X+1.