initialization
initialize
	super initialize.
	themes := (JQBaseTheme withAllSubclasses
		collect: [ :each | each default ])
		asSortedCollection: [ :a :b | a themeName < b themeName ].
	theme := JQBaseTheme default