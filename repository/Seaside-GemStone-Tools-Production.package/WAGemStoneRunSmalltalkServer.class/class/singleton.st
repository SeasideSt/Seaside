accessing
singleton
	Singleton isNil ifTrue: [self initSingleton].
	^Singleton