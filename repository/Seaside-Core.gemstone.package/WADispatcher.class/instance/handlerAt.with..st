accessing
handlerAt: aString with: aBlock
	| dispatcher |
	dispatcher := self.
	GRPlatform subStringsIn: aString splitBy: $/ do: [ :token |
		dispatcher := aBlock value: dispatcher value: token ].
	^ dispatcher