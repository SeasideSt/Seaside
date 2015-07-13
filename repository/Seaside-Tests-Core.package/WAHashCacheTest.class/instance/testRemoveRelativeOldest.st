testing
testRemoveRelativeOldest
	"set maximum size = 10
	add 1, 2, ... 10
	access 1, 2, ... 9 -> 10 has not been accessed for the most time
	add 11
	1, 2, ...9, 11 should be in map"
	| tenMissing |
	cache := WAHashCache
		initialSize: 13
		maximumSize: 10
		maximumAbsoluteAge: 0
		maximumRelativeAge: 0
		overflowAction: WAHashCache removeRelativeOldest.
		
	1 to: 10 do: [ :i |
		cache at: i put: i greaseString ].
	
	"access every but 10"
	1 to: 9 do: [ :i |
		cache at: i ifAbsent: [ self assert: false ] ].
	
	cache at: 11 put: '11'.
	
	1 to: 9 do: [ :i |
		self assert: (cache at: i ifAbsent: [ self assert: false ]) = i greaseString ].
	
	self assert: (cache at: 11 ifAbsent: [ self assert: false ]) = '11'.
	
	tenMissing := false.
	cache at: 10 ifAbsent: [ tenMissing := true ].
	self assert: tenMissing
	