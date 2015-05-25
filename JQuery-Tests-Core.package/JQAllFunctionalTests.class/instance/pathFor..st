private
pathFor: aString
	^ (aString select: [ :each | each isAlphaNumeric ]) asLowercase