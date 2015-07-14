accessing
ports

	ports == nil ifTrue: [ ports := self serverClass defaultPortList ].
	^ports