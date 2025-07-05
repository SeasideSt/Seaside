initialization
initialize

	super initialize.
	components := OrderedCollection new.
	1 to: 100 do:[:i | 
		components add: ((WAHotwireTurboCounterTestComponent newWithValue: i) addDecoration: WATurboFrame new loadLazy; yourself) ].