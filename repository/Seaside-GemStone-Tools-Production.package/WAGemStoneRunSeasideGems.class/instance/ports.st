accessing
ports

	ports == nil ifTrue: [ ports := self adaptorClass defaultPortList ].
	^ports