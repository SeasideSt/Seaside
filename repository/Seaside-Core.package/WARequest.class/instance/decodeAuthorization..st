private
decodeAuthorization: aString
	| lastSpaceIndex |
	lastSpaceIndex := aString lastIndexOf: $ .
	^ GRPlatform current base64Decode: (lastSpaceIndex = 0
		ifTrue: [ aString ]
		ifFalse: [ aString copyFrom: lastSpaceIndex + 1to: aString size ])