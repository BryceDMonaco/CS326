% Bryce Monaco
% CS 326
% HW7

%Just Some Testing
likes(john, flowers).
likes(john, mary).
likes(paul, mary).

%Question 1
%reverse(L, L1)
%For a list consisting of [H|T] I need to concatinate H with the reversed T [reverse(T, X)|H]
reverse([], []).
reverse([X], [X]).  
reverse([H|T], Y) :- reverse(T,T1), append(T1, [H], Y).                      