testing
testKeyAtValue
	1 to: 100 do: [ :i |
		| absent key |
		absent := false.
		cache keyAtValue: i greaseString ifAbsent: [ absent := true ].
		self assert: absent.
		cache at: i put: i greaseString.
		key := cache keyAtValue: i greaseString ifAbsent: [ self assert: false ].
		self assert: key = i ]