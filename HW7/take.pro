% take.pro
% Arsh Chauhan
% 04/19/2016
% Ex C


% take: Takes a number (N) and 2 lists.
% Returns true if first N elements of list 1 == list 2

take(_, [], []).
take(0, _, []).

take(N, [X|Xs], [X|Es]):- M is N-1, take(M,Xs,Es).