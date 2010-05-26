
:- initialization((
	% compile messages with event support in order to measure the implicit overhead
	logtalk_load([category, objects, database, plain, maze, benchmarks], [events(allow)]),
	(current_logtalk_flag(modules, supported) -> ensure_loaded(module); true)
)).
