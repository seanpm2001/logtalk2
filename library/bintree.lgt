
:- object(bintree,
	implements(dictionaryp),
	extends(compound)).

	:- info([
		version is 2.0,
		author is 'Paulo Moura',
		date is 2010/02/26,
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

	as_dictionary(Pairs, Tree) :-
		new(Empty),
		as_dictionary(Pairs, Empty, Tree).

	as_dictionary([], Tree, Tree).
	as_dictionary([Key-Value| Pairs], Tree0, Tree) :-
		insert(Tree0, Key, Value, Tree1),
		as_dictionary(Pairs, Tree1, Tree).

	as_list(Tree, List) :-
		inorder(Tree, List).

	empty(Tree) :-
		Tree == t.

	insert(t, Key, Value, t(Key, Value, t, t)) :-
		nonvar(Key).
	insert(t(Key1, Value1, Left1, Right1), Key, Value, NewTree) :-
		compare(Order, Key, Key1),
		insert(Order, Key1, Value1, Left1, Right1, Key, Value, NewTree).

	insert(=, _, _, Left, Right, Key, Value, t(Key, Value, Left, Right)).
	insert(<, Key1, Value1, Left1, Right1, Key, Value, t(Key1, Value1, Left2, Right1)) :-
		insert(Left1, Key, Value, Left2).
	insert(>, Key1, Value1, Left1, Right1, Key, Value, t(Key1, Value1, Left1, Right2)) :-
		insert(Right1, Key, Value, Right2).

	next(Tree, Key, Next, Value) :-
		next(Tree, Key, Next, Value, []).

	next(t(Key0, Value0, Left, Right), Key, Next, Value, Candidate) :-
		compare(Order, Key0, Key),
		next(Order, Key0, Value0, Left, Right, Key, Next, Value, Candidate).

	next(>, Key0, Value0, Left, _, Key, Next, Value, _) :-
		next(Left, Key, Next, Value, Key0-Value0).
	next(<, _, _, _, Right, Key, Next, Value, Candidate) :-
		next(Right, Key, Next, Value, Candidate).
	next(=, _, _, _, Right, _, Next, Value, Candidate) :-
		(	min(Right, Next, Value) ->
			true
		;	Candidate = (Next-Value)
		).

	previous(Tree, Key, Previous, Value) :-
		previous(Tree, Key, Previous, Value, []).

	previous(t(Key0, Value0, Left, Right), Key, Previous, Value, Candidate) :-
		compare(Order, Key0, Key),
		previous(Order, Key0, Value0, Left, Right, Key, Previous, Value, Candidate).

	previous(>, _, _, Left, _, Key, Previous, Value, Candidate) :-
		previous(Left, Key, Previous, Value, Candidate).
	previous(<, Key0, Value0, _, Right, Key, Previous, Value, _) :-
		previous(Right, Key, Previous, Value, Key0-Value0).
	previous(=, _, _, Left, _, _, Previous, Value, Candidate) :-
		(	max(Left, Previous, Value) ->
			true
		;	Candidate = (Previous-Value)
		).

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

	min(t(Key, Value, t, _), Key, Value) :-
		!.
	min(t(_, _, Left, _), Key, Value) :-
		min(Left, Key, Value).

	max(t(Key, Value, _, t), Key, Value) :-
		!.
	max(t(_ , _, _, Right), Key, Value) :-
		max(Right, Key, Value).

	delete_min(t(Key, Value, t, Right), Key, Value, Right) :-
		!.
	delete_min(t(Key0, Value0, Left, Right), Key, Value, t(Key0, Value0, NewLeft, Right)) :-
		delete_min(Left, Key, Value, NewLeft).

	delete_max(t(Key, Value, Left, t), Key, Value, Left) :-
		!.
	delete_max(t(Key0, Value0, Left, Right), Key, Value, t(Key0, Value0, Left, NewRight)) :-
		delete_max(Right, Key, Value, NewRight).

	keys(Tree, Keys) :-
		keys(Tree, [], Keys).

	keys(t, Keys, Keys).
	keys(t(Key, _, Left, Right), Acc, Keys) :-
		keys(Right, Acc, Acc2),
		keys(Left, [Key| Acc2], Keys).

	delete(t, _, _, t).
	delete(t(Key1, Value1, Left1, Right1), Key, Value, NewTree) :-
		compare(Order, Key, Key1),
		delete(Order, Key1, Value1, Left1, Right1, Key, Value, NewTree).

	delete(=, Key1, Value1, Left1, Right1, Key1, Value1, NewTree) :-
		join(Left1, Right1, NewTree).
	delete(<, Key1, Value1, Left1, Right1, Key, Value, t(Key1, Value1, Left2, Right1)) :-
		delete(Left1, Key, Value, Left2).
	delete(>, Key1, Value1, Left1, Right1, Key, Value, t(Key1, Value1, Left1, Right2)) :-
		delete(Right1, Key, Value, Right2).

	update(OldTree, Key, NewValue, NewTree) :-
		update(OldTree, Key, _, NewValue, NewTree).

	update(t(Key1, Value1, Left1, Right1), Key, OldValue, NewValue, NewTree) :-
		compare(Order, Key, Key1),
		update(Order, Key1, Value1, Left1, Right1, Key, OldValue, NewValue, NewTree).

	update(=, Key, OldValue, Left, Right, Key, OldValue, NewValue, t(Key, NewValue, Left, Right)).
	update(<, Key1, Value1, Left1, Right1, Key, OldValue, NewValue, t(Key1, Value1, Left2, Right1)) :-
		update(Left1, Key, OldValue, NewValue, Left2).
	update(>, Key1, Value1, Left1, Right1, Key, OldValue, NewValue, t(Key1, Value1, Left1, Right2)) :-
		update(Right1, Key, OldValue, NewValue, Right2).

	join(t, Right, Right) :-
		!.
	join(Left, t, Left) :-
		!.
	join(t(Key, Value, Left, Right), Tree, t(Key, Value, Left, Right2)) :-
		join(Right, Tree, Right2).

	:- meta_predicate(map_(*, 1)).
	map_(t(Key, Value, Left, Right), Closure) :-
		call(Closure, Key-Value),
		map_(Left, Closure),
		map_(Right, Closure).
	map_(t, _).

	:- meta_predicate(map(1, *)).
	map(Closure, Tree) :-
		map_(Tree, Closure).

	:- meta_predicate(map_(*, 2, *)).
	map_(t(Key, Value1, Left1, Right1), Closure, t(Key, Value2, Left2, Right2)) :-
		call(Closure, Key-Value1, Key-Value2),
		map_(Left1, Closure, Left2),
		map_(Right1, Closure, Right2).
	map_(t, _, t).

	:- meta_predicate(map(2, *, *)).
	map(Closure, Old, New) :-
		map_(Old, Closure, New).

	:- meta_predicate(apply(*, *, 2, *)).
	apply_(t(Key0,Value0,Left,Right), Key, Closure, NewTree) :-
		compare(Order, Key0, Key),
		apply_(Order, Key0, Value0, Left, Right, Key, Closure, NewTree).

	apply_(=,    _, Value0, Left, Right, Key, Closure, t(Left,Key,Value,Right)) :-
		call(Closure, Value0, Value).
	apply_(>, Key0, Value0, Left, Right, Key, Closure, t(NewLeft,Key0,Value0,Right)) :-
		apply_(Left, Key, Closure, NewLeft).
	apply_(<, Key0, Value0, Left, Right, Key, Closure, t(Left,Key0,Value0,NewRight)) :-
		apply_(Right, Key, Closure, NewRight).

	:- meta_predicate(apply(2, *, *, *)).
	apply(Closure, OldTree, Key, NewTree) :-
		apply_(OldTree, Key, Closure, NewTree).

	new(t).

	size(Dictionary, Size) :-
		size(Dictionary, 0, Size).

	size(t, Size, Size).
	size(t(_, _, Left, Right), Acc, Size) :-
		size(Left, Acc, Acc2),
		Acc3 is Acc2 + 1,
		size(Right, Acc3, Size).

:- end_object.
