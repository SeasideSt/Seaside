testing
testRemoveAbsoluteOldest
	cache := WAHashCache
		initialSize: 13
		maximumSize: 10
		maximumAbsoluteAge: 0
		maximumRelativeAge: 0
		overflowAction: WAHashCache removeAbsoluteOldest.
		
	1 to: 20 do: [ :i |
		cache at: i put: i greaseString ].
	
	1 to: 10 do: [ :i |
		| absent |
		absent := false.
		cache at: i ifAbsent: [ absent := true ].
		self assert: absent ].
	
	11 to: 20 do: [ :i |
		| mapped |
		mapped := cache at: i ifAbsent: [ self assert: false ].
		self assert: mapped = i greaseString ]