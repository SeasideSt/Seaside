tests-policies
testLeastRecentlyUsedCopy
	| keys1 keys2 cacheCopy |
	cache setExpiryPolicy: WALeastRecentlyUsedExpiryPolicy new.
	keys1 := (1 to: 20) collect: [ :index | cache store: index ].
	keys2 := keys1 copy.
	cacheCopy := cache copy.
	
	"touch different objects in each cache"
	1 to: 9 by: 2 do: [ :index | self assert: (cache at: (keys1 at: index)) notNil ].
	2 to: 8 by: 2 do: [ :index | self assert: (cacheCopy at: (keys2 at: index)) notNil ].

	"now overflow the caches"
	keys1 := keys1 , ((21 to: 30) collect: [ :index | cache store: index ]).
	keys2 := keys2 , ((21 to: 30) collect: [ :index | cacheCopy store: index ]).
	cache reap.
	cacheCopy reap.

	"verify that different caches expired different objects"
	1 to: 9 by: 2 do: [ :index | self assert: (cache at: (keys1 at: index)) notNil ].
	1 to: 9 by: 2 do: [ :index | self assert: (cacheCopy at: (keys2 at: index)) isNil ].

	2 to: 8 by: 2 do: [ :index | self assert: (cache at: (keys1 at: index)) isNil ].
	2 to: 8 by: 2 do: [ :index | self assert: (cacheCopy at: (keys2 at: index)) notNil ].

	10 to: 30 do: [ :index | self assert: (cache at: (keys1 at: index)) notNil ].
	10 to: 30 do: [ :index | self assert: (cacheCopy at: (keys2 at: index)) notNil ]
