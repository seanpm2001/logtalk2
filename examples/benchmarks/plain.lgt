
my_append([], List, List).
my_append([Head| Tail], List, [Head| Tail2]) :-
	my_append(Tail, List, Tail2).


my_nrev([], []).
my_nrev([Head| Tail], Reversed) :-
	my_nrev(Tail, ReversedTail),
	my_append(ReversedTail, [Head], Reversed).


my_length(List, Length) :-
	my_length(List, 0, Length).

my_length([], Length, Length).
my_length([_| Tail], Acc, Length) :-
	Acc2 is Acc + 1,
	my_length(Tail, Acc2, Length).


:- dynamic(pred_plain/1).

plain_dyndb(N) :-
	assertz(pred_plain(N)),
	retract(pred_plain(N)).


my_between(Lower, _, Lower).
my_between(Lower, Upper, Integer) :-
	Lower < Upper,
	Next is Lower + 1,
	my_between(Next, Upper, Integer).


my_repeat(_).
my_repeat(N) :-
	N > 1,
	N2 is N - 1,
	my_repeat(N2).


% generate a list containing the first N non-negative integers

generate_list(N, List) :-
	generate_list(0, N, List).

generate_list(N, N, []) :-
	!.
generate_list(M, N, [M| Ms]) :-
	M < N,
	M2 is M + 1,
	generate_list(M2, N, Ms).



maze_solve(Start, Destination, Steps) :- 
	maze_path(Start, Destination, [Start], Path),
	maze_reverse(Path, Steps).

maze_path(Destination, Destination, Path, Path).
maze_path(Node, Destination, Path0, Path) :- 
	maze_link(Node, Next),
	\+ maze_member(Next, Path0),
	maze_path(Next, Destination, [Next | Path0], Path).

maze_link(Node1, Node2 ) :-
	maze_arc(Node1, Node2).
maze_link(Node1, Node2 ) :-
	maze_arc(Node2, Node1).

maze_arc(1, 2). maze_arc(1, 3). maze_arc(1, 4). maze_arc(1, 5). maze_arc(1, 9).
maze_arc(2, 9).
maze_arc(3, 6).
maze_arc(4, 5). maze_arc(4, 7).
maze_arc(5, 8).

maze_member(Element, [Element| _]).
maze_member(Element, [_| List]) :-
	maze_member(Element, List).
    
maze_reverse(List, Reversed) :-
	maze_reverse(List, [], Reversed, Reversed).

maze_reverse([], Reversed, Reversed, []).
maze_reverse([Head| Tail], List, Reversed, [_| Bound]) :-
	maze_reverse(Tail, [Head| List], Reversed, Bound).
