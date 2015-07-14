*seaside-tests-gemstone-core
testRcLastAccess
	| keys |
	cache setExpiryPolicy: WARcLastAccessExpiryPolicy new.
	keys := (1 to: 30) collect: [ :index | cache store: index ].
	cache reap.
	keys do: [ :each | self assert: (cache at: each) notNil ]