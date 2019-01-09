control
portString
	| portString |
	portString := '"'.
	ports do: [:port | portString := portString, port asString, ' ' ].
	portString := portString, '"'.
	^portString