accessing
staticDelegate
	^ staticDelegate ifNil: [ staticDelegate := self initializeStaticDelegate ]