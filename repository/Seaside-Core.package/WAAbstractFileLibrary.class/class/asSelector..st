private
asSelector: aFilename
	| mainPart extension |
	mainPart := (aFilename copyUpToLast: $.)
		select: [ :each | each isAlphaNumeric ].
			
	mainPart isEmpty ifTrue: [ ^ nil ].
	
	mainPart first isDigit ifTrue: [mainPart := '_' , mainPart].
		
	extension := ((aFilename copyAfterLast: $.)
		select: [ :each | each isAlphaNumeric ]) asLowercase capitalized.
	^ (mainPart, extension) asSymbol