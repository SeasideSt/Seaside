processing
handle: aRequestContext
	| set fields |
	set := Set new.
	fields := aRequestContext request fields.
	fields keysDo: [ :key |
		callbacks at: key ifPresent: [ :callback |
			(callback isEnabledFor: aRequestContext)
				ifTrue: [ set add: callback ] ] ].
	"Process the callbacks in order of priority"
	set sorted do: [ :callback |
		| fieldValues |
		fieldValues := fields allAt: callback key.
		WACurrentRequestLogItem value ifNotNil: [ :logItem |
			logItem addCallbackCall: (WACallbackCall callback: callback fieldValues: fieldValues) ].
		callback evaluateWithFieldValues: fieldValues ]