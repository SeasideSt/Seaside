registration
unregister: aString in: aDispatcher
	"Unregister the application aString in aDispatcher."

	| path dispatcher |
	path := aString subStrings: '/'.
	dispatcher := path
		inject: aDispatcher
		into: [ :result :each |
			result handlers
				at: each
				ifAbsent: [ ^ nil ] ].
	^ dispatcher parent
		unregister: dispatcher