accessing
selectedComponent
	^ (components detect: [ :each | each key = self selection ] ifNone: [ ^ nil ]) value