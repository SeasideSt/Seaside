control
defaultPortString

	| portString |
	portString := '"'.
	self default ports do: [:port | portString := portString, port asString, ' ' ].
	portString := portString, '"'.
	^portString