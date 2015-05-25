*seaside-pharo-email
isIpAddress: aString
	| ip |
	ip := aString subStrings: '.'.
	^ ip size = 4
		and: [ ip allSatisfy: [ :each | each greaseInteger notNil
				and: [ each greaseInteger between: 0 and: 255 ] ] ]