initialization
initialize
	super initialize.
	tree := WATree new
		root: Collection;
		labelBlock: [ :class | class name ];
		childrenBlock: [ :class | class subclasses ];
		selectBlock: [ :class | selected := class name ];
		canSelectBlock: [ :class | class subclasses notEmpty ];
		yourself