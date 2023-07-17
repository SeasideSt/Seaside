accessing
translatedArguments: classesToSelect

	| env |
	env := classesToSelect
		       ifNil: [ RBBrowserEnvironment new, RBBrowserEnvironment new allMetaClasses ]
		       ifNotNil: [ RBBrowserEnvironment new forClasses: classesToSelect ].
	^ self translatedArgumentsIn: env