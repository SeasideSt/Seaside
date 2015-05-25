actions
configure: aHandler
	| configComponent |
	aHandler isDispatcher ifTrue: [ self dispatcher: aHandler ].
	self selection: aHandler.
	self editor home.
	configComponent := aHandler configurationComponent.
	configComponent editor isNil 
		ifFalse: [ configComponent editor beComponent ].
	self show: configComponent