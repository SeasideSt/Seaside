updating
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.
	self selected notNil 
		ifTrue: [ anHtmlRoot title: self selected title ]