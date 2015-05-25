actions
removeConfiguration: aConfiguration
	| myApplication authFilter |
	(aConfiguration isKindOf: WAAuthConfiguration) ifTrue: [
		myApplication := self myApplication.
		authFilter := myApplication filters detect: [ :each | each isKindOf: WAAuthenticationFilter ] ifNone: [ nil ].
		authFilter isNil ifFalse: [
			myApplication 
				preferenceAt: #login
				put: nil.
			myApplication 
				preferenceAt: #passwordHash
				put: nil.
			myApplication removeFilter: authFilter ] ].
	self configuration removeParent: aConfiguration.
	self parent buildGroups