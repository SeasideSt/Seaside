*seaside-gemstone-email
seasideIsIpAddress: aString

	| ip |
	ip := aString findTokens: '.'.
	^ (ip size = 4) 
		ifFalse: [false]
		ifTrue: [
			ip allSatisfy: [:ea | ea greaseInteger
				ifNil: [false]
				ifNotNilDo: [:num | num between: 0 and: 255]]]