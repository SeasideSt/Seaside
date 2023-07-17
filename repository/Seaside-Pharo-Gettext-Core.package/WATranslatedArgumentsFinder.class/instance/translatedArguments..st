accessing
translatedArguments: classesToSelect

	| env |
	env := classesToSelect
		       ifNil: [ RBBrowserEnvironment new forClasses: RBBrowserEnvironment new allNonMetaClasses, RBBrowserEnvironment new allMetaClasses ]
		       ifNotNil: [ RBBrowserEnvironment new forClasses: classesToSelect ].
	^ self translatedArgumentsIn: env