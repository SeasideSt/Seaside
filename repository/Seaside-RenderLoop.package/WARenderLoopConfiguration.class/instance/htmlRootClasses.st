description
htmlRootClasses
	^ WAHtmlRoot allSubclasses asSortedCollection: [ :a :b |
		a name <= b name ]