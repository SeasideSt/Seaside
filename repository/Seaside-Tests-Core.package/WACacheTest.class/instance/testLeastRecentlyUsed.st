tests-policies
testLeastRecentlyUsed
	| keys |
	cache setExpiryPolicy: WALeastRecentlyUsedExpiryPolicy new.
	keys := (1 to: 30) collect: [ :index | cache store: index ].
	cache reap.
	1 to: 9 do: [ :index | self assert: (cache at: (keys at: index)) isNil ].
	10 to: 30 do: [ :index | self assert: (cache at: (keys at: index)) = index ]