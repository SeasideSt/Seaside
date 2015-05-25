updating
updateUrl: aUrl
	super updateUrl: aUrl.
	self selected notNil 
		ifTrue: [ aUrl addToPath: self selected class name ]