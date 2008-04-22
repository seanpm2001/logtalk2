
:- object(set(_Type),
	extends(set)).

	:- info([
		version is 1.1,
		author is 'Paulo Moura',
		date is 2008/4/22,
		comment is 'Set predicates with elements constrained to a single type.']).

	valid(-) :-				% catch variables
		!,
		fail.
	valid([]) :-
		!.
	valid([Element| Set]) :-
		check_order(Set, Element).

	check_order(-, _) :-	% catch unbound tails
		!,
		fail.
	check_order([], _) :-
		!.
	check_order([Element2| Set], Element1) :-
		parameter(1, Type),
		Type::valid(Element1),
		Type::valid(Element2),
		Element2 @> Element1,
		check_order(Set, Element2).

:- end_object.
