private
fieldsFromBody: aFSResponderRole

	^(self isUrlEncoded: aFSResponderRole)
		ifTrue: [ aFSResponderRole stdin asString ]
		ifFalse: [ '' ].