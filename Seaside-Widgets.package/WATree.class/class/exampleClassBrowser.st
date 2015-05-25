examples
exampleClassBrowser
	^ self new
		root: Collection;
		labelBlock: [ :class | class name ];
		childrenBlock: [ :class | class subclasses ];
		yourself