initialization
setPorts: aString
	ports := OrderedCollection new: 1.
	GRPlatform subStringsIn: aString splitBy: $, do: [ :token |
		ports add: token greaseInteger ]