accessing
domain
	domain isNil ifTrue: [
		"determine the domain name
		1. try if it is configured on the application
		2. use the application name
		3. send #defaultApplicationName"
		| configuredDomain |
		configuredDomain := [ self application gettextDomain ]
			on: WAAttributeNotFound
			do: [ :error | nil ].
		domain := configuredDomain isEmptyOrNil
			ifFalse: [ configuredDomain ]
			ifTrue: [
				| applicationName |
				applicationName := self application name.
				applicationName isEmptyOrNil
					ifFalse: [ applicationName ]
					ifTrue: [ self defaultApplicationName ] ] ].
	^ domain