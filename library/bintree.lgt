
:- object(bintree,
	implements(dictionaryp),
	extends(compound)).

	:- info([
		version is 2.0,
		author is 'Paulo Moura',
		date is 2010/02/25,
		comment is 'Simple binary tree implementation of the dictionary protocol. Uses standard order to compare keys.']).

	:- public(preorder/2).
	:- mode(preorder(@tree, -list), one).
	:- info(preorder/2,
		[comment is 'Preorder tree traversal.',
		 argnames is ['Tree', 'List']]).

	:- public(inorder/2).
	:- mode(inorder(@tree, -list), one).
	:- info(preorder/2,
		[comment is 'Inorder tree traversal.',
		 argnames is ['Tree', 'List']]).

	:- public(postorder/2).
	:- mode(postorder(@tree, -list), one).
	:- info(preorder/2,
		[comment is 'Postorder tree traversal.',
		 argnames is ['Tree', 'List']]).

	preorder(Tree, List) :-
		preorder(Tree, [], List).

	preorder(t, List, List).
	preorder(t(Key, Value, Left, Right), Acc, [Key-Value| List]) :-
		preorder(Right, Acc, Acc2),
		preorder(Left, Acc2, List).

	inorder(Tree, List) :-
		inorder(Tree, [], List).

	inorder(t, List, List).
	inorder(t(Key, Value, Left, Right), Acc, List) :-
		inorder(Right, Acc, Acc2),
		inorder(Left, [Key-Value| Acc2], List).

	postorder(Tree, List) :-
		postorder(Tree, [], List).

	postorder(t, List, List).
	postorder(t(Key, Value, Left, Right), Acc, List) :-
		postorder(Right, [Key-Value| Acc], Acc2),
		postorder(Left, Acc2, List).

	as_dictionary(Pairs, Dictionary) :-
		new(Empty),
		insert_all(Pairs, Empty, Dictionary).

	as_list(Tree, List) :-
		inorder(Tree, List).

	empty(Tree) :-
		Tree == t.

	insert(Key, Value, t, t(Key, Value, t, t)) :-
		nonvar(Key).
	insert(Key, Value, t(Key1, Value1, Left1, Right1), t(Key1, Value2, Left2, Right2)) :-
		compare(Order, Key, Key1),
		insert(Order, Key, Value, Key1, Value1, Left1, Right1, Value2, Left2, Right2).

	insert(=, _, Value, _, _, Left, Right, Value, Left, Right).
	insert(<, Key, Value, _, Value1, Left1, Right, Value1, Left2, Right) :-
		insert(Key, Value, Left1, Left2).
	insert(>, Key, Value, _, Value1, Left, Right1, Value1, Left, Right2) :-
		insert(Key, Value, Right1, Right2).

	insert_all([], Tree, Tree).
	insert_all([Key-Value| Rest], Old, New) :-
		insert(Key, Value, Old, Aux),
		insert_all(Rest, Aux, New).

	lookup(Key, Value, Tree) :-
		(	var(Key) ->
			lookup_var(Key, Value, Tree)
		;	lookup_nonvar(Key, Value, Tree)
		).

	lookup_nonvar(Key, Value, t(Key1, Value1, Left1, Right1)) :-
		compare(Order, Key, Key1),
		lookup_nonvar(Order, Key, Value, Value1, Left1, Right1).

	lookup_nonvar(=, _, Value, Value, _, _).
	lookup_nonvar(<, Key, Value, _, Left, _) :-
		lookup_nonvar(Key, Value, Left).
	lookup_nonvar(>, Key, Value, _, _, Right) :-
		lookup_nonvar(Key, Value, Right).

	lookup_var(Key, Value, t(_, _, Left, _)) :-
		lookup_var(Key, Value, Left).
	lookup_var(Key, Value, t(Key, Value,_,_)).
	lookup_var(Key, Value, t(_, _, _, Right)) :-
		lookup_var(Key, Value, Right).

	keys(Tree, Keys) :-
		keys(Tree, [], Keys).

	keys(t, Keys, Keys).
	keys(t(Key, _, Left, Right), Acc, Keys) :-
		keys(Right, Acc, Acc2),
		keys(Left, [Key| Acc2], Keys).

	delete(t, _, _, t).
	delete(t(Key1, Value1, Left1, Right1), Key, Value, Out) :-
		compare(Order, Key, Key1),
		delete(Order, Key1, Value1, Left1, Right1, Key, Value, Out).

	delete(=, Key1, Value1, Left1, Right1, Key1, Value1, Out) :-
		join(Left1, Right1, Out).
	delete(<, Key1, Value1, Left1, Right1, Key, Value, t(Key1, Value1, Left2, Right1)) :-
		delete(Left1, Key, Value, Left2).
	delete(>, Key1, Value1, Left1, Right1, Key, Value, t(Key1, Value1, Left1, Right2)) :-
		delete(Right1, Key, Value, Right2).

	join(t, Right, Right) :-
		!.
	join(Left, t, Left) :-
		!.
	join(t(Key, Value, Left, Right), Tree, t(Key, Value, Left, Right2)) :-
		join(Right, Tree, Right2).

	:- meta_predicate(map_(*, 2, *)).
	map_(t(Key, Value1, Left1, Right1), Closure, t(Key, Value2, Left2, Right2)) :-
		call(Closure, Key-Value1, Key-Value2),
		map_(Left1, Closure, Left2),
		map_(Right1, Closure, Right2).
	map_(t, _, t).

	:- meta_predicate(map(2, *, *)).
	map(Closure, Old, New) :-
		map_(Old, Closure, New).

	new(t).

	size(Dictionary, Size) :-
		size(Dictionary, 0, Size).

	size(t, Size, Size).
	size(t(_, _, Left, Right), Acc, Size) :-
		size(Left, Acc, Acc2),
		Acc3 is Acc2 + 1,
		size(Right, Acc3, Size).

:- end_object.
