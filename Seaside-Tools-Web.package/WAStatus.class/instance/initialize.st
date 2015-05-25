initialization
initialize
	super initialize.
	navigation := WASimpleNavigation new.
	WAStatusItem sortedConcreteSubinstances do: [ :each |
		each isSupported ifTrue: [
			navigation add: each label: each label ] ].
	navigation selectFirst