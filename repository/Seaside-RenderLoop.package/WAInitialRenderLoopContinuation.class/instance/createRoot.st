creational
createRoot
	| root |
	root := self requestContext rootComponentIfAbsent: [ self rootClass new ].
	^ self rootDecorationClasses
		inject: root
		into: [ :component :decorationClass |
			component 
				addDecoration: decorationClass new;
				yourself ]