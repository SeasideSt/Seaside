private
asSelector: aFilename
	| mainPart extension |
	mainPart := (aFilename copyUpToLast: $.)
		select: [ :each | each isAlphaNumeric ].
	[ mainPart isEmpty not and: [ mainPart first isDigit ] ]
		whileTrue: [ mainPart := mainPart allButFirst ].
	
	mainPart isEmpty ifTrue: [ ^ nil ].
		
	extension := ((aFilename copyAfterLast: $.)
		select: [ :each | each isAlphaNumeric ]) asLowercase capitalized.
	^ (mainPart, extension) asSymbol