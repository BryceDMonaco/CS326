% Bryce Monaco
% CS 326
% HW7

%Just Some Testing
likes(john, flowers).
likes(john, mary).
likes(paul, mary).

%-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

%Question 1
%reverse(L, L1)
%For a list consisting of [H|T] I need to concatinate H with the reversed T [reverse(T, X)|H]?
reverse([], []).
reverse([X], [X]).  
reverse([H|T], Y) :- reverse(T,T1), append(T1, [H], Y).

%-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

%Question 2
%take(L, N, L1)
take([], _, []). %Case 1: L is empty. No matter the N and no matter the second list, the empty list is contained
take(_, 0, []). %Case 2: N=0
take([H|T], N, [H1|T1]) :- H=H1, take(T, X, T1), N is X+1.

%-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

%Question 3
%Trees
tree(nil).
tree(node(_, Left, Right)) :- tree(Left), tree(Right).

%3A - nleaves(T, N).
% 	Example IO: nleaves(node(1, node(2, node(3,nil,nil), node(4,nil,nil)), node(5,nil,nil)), N). -> N=3
% 	Note: For some reason the command above prompts to correct itself, just let it.
nLeaves(node(_, nil, nil), N) :- N is 1. %Case 1: Reached Leaf (No Children)
nLeaves(node(_, L, nil), N) :- nLeaves(L, Nl), N is Nl. %Case 2: Only has left child
nLeaves(node(_, nil, R), N) :- nLeaves(R, Nr), N is Nr. %Case 3: Only has right child
nLeaves(node(_, L, R), N) :- nLeaves(L, Nl), nLeaves(R,Nr), N is (Nl + Nr). %Case 4: Has both children

%3B - treeMember(E, T). Searches for E in T
%	Example IO: treeMember(3, node(1, node(2, node(3,nil,nil), node(4,nil,nil)), node(5,nil,nil))). -> Yes
treeMember(E, node(E, _, _)). %Case 1: E is a member
treeMember(E, node(_, L, R)) :- treeMember(E, L); treeMember(E, R). %Case 2: Need to check left or right side for E

%3C - preOrder(T, L). Generates L which is a PO Traversal of T
%	Example IO: preOrder(node(1, node(2, node(3,nil,nil), node(4,nil,nil)),node(5,nil,nil)), L). -> L = [1, 2, 3, 4, 5] 
preOrder(nil, []).
preOrder(node(X, L, R), [X|T]) :- preOrder(L, Ll), append(Ll, Lr, T), preOrder(R, Lr).

%3D - height(T, N). Finds height N of tree T
%	Example IO:  height(node(1, node(2, node(3,nil,nil), node(4,nil,nil)), node(5,nil,nil)), N). -> N = 3
height(nil, N) :- N is 0. %Case 1: Reached end of branch
height(node(_, L, R), N) :- height(L, Nl), height(R, Nr), N is (1+max(Nl, Nr)).%Case 2: Have not reached end

%-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

%Question 4
%insert(X, L, L1). Inserts X into the correct spot in ordered list L, L1 is the list with X inserted.
%	Example IO: insert(5, [1,3,4,7], L1). -> L1 = [1,3,4,5,7] 
insert(X, [], [X]).
insert(X, [H|T], [X,H|T]) :- X < H, !.
insert(X, [H|T0], [H|T]) :- insert(X, T0, T).

%-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

%Question 5 - Extra Credit
%flatten(A, B)
%	Example IO: flatten([1, [2, [3, 4]], 5], L). -> L = [1, 2, 3, 4, 5]

flatten([], []) :- !.
flatten([H|T], B) :- !, flatten(H, C), flatten(T, D), append(C, D, B).
flatten(A, [A]).