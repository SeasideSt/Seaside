testing
testAtPutOverwrite
	1 to: 100 do: [ :i |
		| absent mapped |
		absent := false.
		cache at: i ifAbsent: [ absent := true ].
		self assert: absent.
		cache at: i put: 'zork'.
		mapped := cache at: i put: i greaseString.
		self assert: mapped = i greaseString.
		mapped := cache at: i ifAbsent: [ self assert: false ].
		self assert: mapped = i greaseString ]