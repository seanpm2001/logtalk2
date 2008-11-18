
:- object(meta,
	implements(metap)).

	:- info([
		version is 2.3,
		date is 2008/11/18,
		author is 'Paulo Moura',
		comment is 'Some useful meta-predicates.']).

	:- alias(metap, map/2, succeeds/2).
	:- alias(metap, include/3, filter/3).

	callable(Term) :-
		nonvar(Term),
		functor(Term, Functor, _),
		atom(Functor).

	:- meta_predicate(include(1, *, *)).
	include(_, [], []) :- !.
	include(Closure, [Arg| Args], Included) :-
		(	call(Closure, Arg) ->
			Included = [Arg| Rest]
		;	Included = Rest
		),
		include(Closure, Args, Rest).

	:- meta_predicate(exclude(1, *, *)).
	exclude(_, [], []) :- !.
	exclude(Closure, [Arg| Args], Excluded) :-
		(	call(Closure, Arg) ->
			Excluded = Rest
		;	Excluded = [Arg| Rest]
		),
		exclude(Closure, Args, Rest).

	:- meta_predicate(partition(1, *, *, *)).
    partition(_, [], [], []) :- !.
    partition(Closure, [Arg| Args], Included, Excluded) :-
        (   call(Closure, Arg) ->
	        Included = [Arg| RestIncluded],
	        Excluded = RestExcluded
        ;   Included = RestIncluded,
            Excluded = [Arg| RestExcluded]
        ),
        partition(Closure, Args, RestIncluded, RestExcluded).

	:- meta_predicate(ignore(::)).
	ignore(Goal) :-
		(	call(Goal) ->
			true
		;	true
		).

	:- meta_predicate(fold_left(3, *, *, *)).
	fold_left(_, Result, [], Result).
	fold_left(Closure, Acc, [Arg| Args], Result) :-
		call(Closure, Acc, Arg, Acc2),
		fold_left(Closure, Acc2, Args, Result).

	:- meta_predicate(fold_right(3, *, *, *)).
	fold_right(_, Result, [], Result).
	fold_right(Closure, Acc, [Arg| Args], Result) :-
		fold_right(Closure, Acc, Args, Acc2),
		call(Closure, Arg, Acc2, Result).

	:- meta_predicate(map(1, *)).
	map(_, []).
	map(Closure, [Head| Tail]) :-
		call(Closure, Head),
		map(Closure, Tail).

	:- meta_predicate(map(2, *, *)).
	map(_, [], []).
	map(Closure, [A| As], [B| Bs]) :-
		call(Closure, A, B),
		map(Closure, As, Bs).

	:- meta_predicate(map(3, *, *, *)).
	map(_, [], [], []).
	map(Closure, [A| As], [B| Bs], [C| Cs]) :-
		call(Closure, A, B, C),
		map(Closure, As, Bs, Cs).

	:- meta_predicate(map(4, *, *, *, *)).
	map(_, [], [], [], []).
	map(Closure, [A| As], [B| Bs], [C| Cs], [D| Ds]) :-
		call(Closure, A, B, C, D),
		map(Closure, As, Bs, Cs, Ds).

:- end_object.
