% search2(Elem, List)
search2(E, [E|[E|T]]) :- !.
search2(E, [H|T]) :- search2(E, T).

% search_two(Elem, List)
search_two(E, [E|T]) :- member(E, T).
search_two(E, [_|T]) :- search_two(E, T).

% size(List, Size)
size([], 0) :- !.
size([H|T], S) :- size(T, N), S is N + 1.

% sum(List, Sum)
sum([], 0) :- !.
sum([H|T], S) :- sum(T, N), S is N + H.

% max(List, Max, Min)
l_max([], TM, TM).
l_max([H|T], TM, M) :- H > TM, !, l_max(T, H, M).
l_max([H|T], TM, M) :- l_max(T, TM, M).
l_max([H|T], Max) :- l_max([H|T], 0, Max).

l_min([], TM, TM).
l_min([H|T], TM, M) :- H < TM, !, l_min(T, H, M).
l_min([H|T], TM, M) :- l_min(T, TM, M).
l_min([H|T], Min) :- l_min([H|T], H, Min).

max([H|T], Max, Min) :- l_max([H|T], Max), l_min([H|T], Min).

% split(List1, Elems, SubList1, SubList2).
split([], N, [], []).
split([H|T], N, L1, [H|L2]) :- N = 0, !, split(T, N, L1, L2).
split([H|T], N, [H|L1], L2) :- CN is N - 1, split(T, CN, L1, L2).

% rotate(List, RotatedList)
rotate([H|T], L2) :- append(T, H, L2).

% dice(X)
dice(R) :- member(R, [1, 2, 3, 4, 5, 6]).

% three_dice(L)
three_dice(N, L) :-
	dice(D1),
	dice(D2),
	dice(D3),
	R is D1 + D2 + D3,
	N = R,
	L = [D1, D2, D3].

% dropAny(?Elem, ?List, ?OutList)
dropAny(X, [H|T], T).
dropAny(X, [H|Xs], [H|L]) :- dropAny(X, Xs, L).

% dropFirst
dropFirst(X, [H|T], T) :- !.
dropFirst(X, [H|Xs], [H|L]) :- dropFirst(X, Xs, L).

% dropLast
dropLast(X, [H|Xs], L4) :- reverse([H|Xs], L2), dropFirst(X, L2, L3), reverse(L3, L4).

% dropAll
dropAll(X, [], []).
dropAll(X, [X|T], L) :- !, dropAll(X, T, L).
dropAll(X, [H|T], [H|L]) :- dropAll(X, T, L).

%% GRAPHS

% fromList
fromList([_], []).
fromList([H1, H2|T], [e(H1,H2)|L]) :- fromList([H2|T], L).

% fromCircList
last([H], H).
last([H|T], R) :- last(T, R).

appendLast([H|T], L) :- last(T, X), append([X], [H|T], L).

fromCircList([H1,H2|T], [e(H3, H4)|L]) :- appendLast([H1,H2|T], [H3,H4|T2]), !, fromList([H1,H2|T], L).



