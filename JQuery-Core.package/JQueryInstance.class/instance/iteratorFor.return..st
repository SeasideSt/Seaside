private
iteratorFor: anObject return: aBoolean
	| this |
	anObject isBlock
		ifFalse: [ ^ anObject asFunction return: true ].
	this := (JQueryClass context: self renderContext)
			rendererClass: self rendererClass;
			this.
	anObject argumentCount = 1
		ifTrue: [ anObject value: this ]
		ifFalse: [ anObject value: this value: (JSStream argument: 0) ].
	^ this asFunction return: aBoolean