
:- initialization((
	logtalk_load(library(all_loader), [reload(skip)]),
	logtalk_load(roots(loader), [reload(skip)]),
	logtalk_load(relations(loader), [reload(skip)]),
	logtalk_load(bricks, [events(on)]))).
