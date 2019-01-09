handlers
handlersOfDispatcher: aWADispatcher

	^ aWADispatcher isDispatcher
		ifTrue: [ | dict |
			dict := Dictionary new.
			aWADispatcher handlers keysAndValuesDo: [:key :value |
				dict at: key put: value].
			dict]
		ifFalse: [#()]