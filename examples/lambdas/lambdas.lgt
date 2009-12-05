
:- object(countries).

	:- info([
		version is 1.0,
		date is 2009/11/28,
		author is 'Paulo Moura',
		comment is 'Simple example of using lambda expressions to simplify setof/3 and similar calls.']).

	:- public(currencies_wrong/1).
	currencies_wrong(Currencies) :-
		setof(Currency, country(_, _, _, Currency), Currencies).

	:- public(currencies_no_lambda/1).
	currencies_no_lambda(Currencies) :-
		setof(Currency, Country^Capital^Population^country(Country, Capital, Population, Currency), Currencies).

	:- public(currencies_lambda/1).
	currencies_lambda(Currencies) :-
		setof(Currency, {Currency}/country(_, _, _, Currency), Currencies).

	% country(Country, Capital, Population, Currency)
	country(portugal, lisbon, 10, euro).
	country(spain, madrid, 46, euro).
	country(england, london, 51, pound_sterling).
	country(malaysia, kuala_lumpur, 28, ringgit).
	country(iraq, baghdad, 31, dinar).
	country(tunisia, tunis, 10, dinar).

:- end_object.



:- object(sigma).

	:- info([
		version is 1.0,
		author is 'Artur Miguel Dias',
		date is 2009/12/04,
		comment is 'Generic sum predicate for testing lambda expressions.']).

	% note that is simple an example of using lambda expressions; Logtalk
	% already includes a fold_left/4 predicate in its library that could
	% easily be used for performing the same computations

	:- public(sum/4).
	:- meta_predicate(sum(2, *, *, *)).

	sum(Closure, Inf, Sup, Result) :-
		sum(Closure, Inf, Sup, 0, Result).

	sum(Closure, Inf, Sup, Acc, Result) :-				
		(	Inf =< Sup ->
			call(Closure, Inf, Sum),
			Acc2 is Acc + Sum,
			Next is Inf + 1,
			sum(Closure, Next, Sup, Acc2, Result)
		;	Result = Acc
		).

:- end_object.



:- object(tests).

	:- info([
		version is 1.0,
		date is 2009/11/28,
		author is 'Paulo Moura',
		comment is 'Some tests for lambda expressions collected from public forums.']).

	:- public(common_prefix/3).  

	common_prefix(Front, Xs, Ys) :-
		meta::map({Front}/(list::append(Front)), Xs, Ys).

	:- public(test/0).

	test :-
		call(f, A1, A2), write(1),
		call([X]>>f(X), A1, A2), write(2),
		call([X,Y]>>f(X,Y), A1, A2), write(3),
		call([X]>>({X}/[Y]>>f(X,Y)), A1, A2), write(4),
		call(call(f, A1), A2), write(5),
		call(f(A1), A2), write(6),
		f(A1, A2), write(0).

	f(x, y).

:- end_object.
