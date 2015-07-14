testing
testRemove
	1 to: 100 do: [ :i |
		cache at: i put: i greaseString ].
	
	1 to: 100 do: [ :i |
		| absent |
		self assert: (cache at: i ifAbsent: [ self assert: false ]) = i greaseString.
		cache remove: i greaseString.
		absent := false.
		cache at: i ifAbsent: [ absent := true ].
		self assert: absent ]