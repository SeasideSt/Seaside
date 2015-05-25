accessing
taskClasses
	^ WATask allSubclasses select: [ :each | each subclasses isEmpty ]