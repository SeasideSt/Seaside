accessing
path: aString
	path := (aString isNil or: [
		aString isEmpty or: [ 
			aString = '/' ] ])
				ifTrue: [ '/' ]
				ifFalse: [
					(aString first = $/
						ifTrue: [ aString ]
						ifFalse: [ '/', aString ]) trimRight: [ :character | character = $/ ] ].

	self
		pathUnencoded: path
		codec: nil