creation
expression: aString context: anObject
	"This function accepts a string containing a CSS selector which is then used to match a set of elements."
	
	^ (JQueryInstance
		context: self renderContext
		constructor: (anObject isNil
			ifTrue: [ Array with: aString ]
			ifFalse: [ Array with: aString with: anObject ]))
				rendererClass: self rendererClass;
				yourself