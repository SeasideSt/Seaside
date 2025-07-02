*seaside-squeak-email
isIpAddress: aString
	| ip |
	ip := GRPlatform subStringsIn: aString splitBy: $..
	^ ip size = 4
		and: [ ip allSatisfy: [ :each |
				each greaseInteger notNil
					and: [ each greaseInteger between: 0 and: 255 ] ] ]