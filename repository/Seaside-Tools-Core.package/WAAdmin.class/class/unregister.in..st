registration
unregister: aString in: aDispatcher
	"Unregister the application aString in aDispatcher."

	| dispatcher |
	dispatcher := aDispatcher.
	GRPlatform subStringsIn: aString splitBy: $/ do: [ :each |
		dispatcher := dispatcher handlers
				at: each
				ifAbsent: [ ^ nil ] ].
	^ dispatcher parent
		unregister: dispatcher