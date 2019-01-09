default serviceVM tasks
serviceVMTaskServiceExample
	"WAGemStoneServiceTask initialize"


	^self 
		name: 'Service VM Example'
		frequency: 1 " run once per 200ms"
		valuable: [:vmTask | | persistentCounterValue |
			((self outstandingRequests < 100)
				and: [ (persistentCounterValue := WAGemStoneServiceTask sharedCounterValue) > vmTask state ])
				ifTrue: [ | tasks repeat |
					repeat := true.
					[ repeat and: [ (self outstandingRequests < 100) ]] whileTrue: [ 
						repeat := false.
						tasks := #().
						GRPlatform current doTransaction: [ 
							WAGemStoneServiceTask queue size > 0
								ifTrue: [ 
									vmTask state: persistentCounterValue.
									tasks := WAGemStoneServiceTask queue removeCount: 10 .
									WAGemStoneServiceTask inProcess addAll: tasks ]]. 
						tasks do: [:task | [ task processTask ] fork ].
						repeat := tasks size > 0
							ifTrue: [ (GRPlatform current doTransaction: [ WAGemStoneServiceTask queue size > 0 ])
										and: [self outstandingRequests  < 100]]
							ifFalse: [ false ]]]]
		reset: [:vmTask | vmTask state: 0 ]