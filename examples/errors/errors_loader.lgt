
:- initialization((
	catch(
		logtalk_load(
			[lgtmthdredef],
			[unknown(warning), misspelt(warning), singletons(warning), plredef(warning), lgtredef(warning), report(on)]),
		_,
		true),
	catch(
		logtalk_load(
			[invclause],
			[unknown(warning), misspelt(warning), singletons(warning), plredef(warning), lgtredef(warning), report(on)]),
		_,
		true),
	catch(
		logtalk_load(
			[unknowndir],
			[unknown(warning), misspelt(warning), singletons(warning), plredef(warning), lgtredef(warning), report(on)]),
		_,
		true),
	catch(
		logtalk_load(
			[noninstdir],
			[unknown(warning), misspelt(warning), singletons(warning), plredef(warning), lgtredef(warning), report(on)]),
		_,
		true),
	catch(
		logtalk_load(
			[invargdir],
			[unknown(warning), misspelt(warning), singletons(warning), plredef(warning), lgtredef(warning), report(on)]),
		_,
		true),
	catch(
		logtalk_load(
			[unmatchdir],
			[unknown(warning), misspelt(warning), singletons(warning), plredef(warning), lgtredef(warning), report(on)]),
		_,
		true),
	catch(
		logtalk_load(
			[catdynpred],
			[unknown(warning), misspelt(warning), singletons(warning), plredef(warning), lgtredef(warning), report(on)]),
		_,
		true),
	catch(
		logtalk_load(
			[ccredef],
			[unknown(warning), misspelt(warning), singletons(warning), plredef(warning), lgtredef(warning), report(on)]),
		_,
		true),
	catch(
		logtalk_load(
			[usesrepeated],
			[unknown(warning), misspelt(warning), singletons(warning), plredef(warning), lgtredef(warning), report(on)]),
		_,
		true),
	catch(
		logtalk_load(
			[usesconflict],
			[unknown(warning), misspelt(warning), singletons(warning), plredef(warning), lgtredef(warning), report(on)]),
		_,
		true))).
