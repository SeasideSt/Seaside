processing
handle: aRequestContext
	| set fields |
	set := Set new.
	fields := aRequestContext request fields.
	fields keysDo: [ :key |
		callbacks at: key ifPresent: [ :callback |
			(callback isEnabledFor: aRequestContext)
				ifTrue: [ set add: callback ] ] ].
	set sorted do: [ :callback |
		callback evaluateWithFieldValues:
			(fields allAt: callback key) ]