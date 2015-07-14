cache reaping
reapSeasideCache

	| dps expired |
	expired := 0.
	dps := OrderedCollection with: WADispatcher default.
	[ dps isEmpty ] whileFalse: [ | dp |
		dp := dps removeFirst.
		dp isApplication
			ifTrue: [
				expired := expired + (self reapHandlerCache: dp dispatchers: dps) ]
			ifFalse: [ 
				dp handlers valuesDo: [:ep |
					expired := expired + (self reapHandlerCache: ep dispatchers: dps) ]]].
	^expired