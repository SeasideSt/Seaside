processing
handleFiltered: aRequestContext
	| item |
	item := WAProfilerItem request: aRequestContext request copy.
	[ item profile: [ super handleFiltered: aRequestContext ] ]
		ensure: [ items := items copyWith: item ]