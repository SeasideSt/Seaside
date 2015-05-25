execution
execute
	| dispatcher |
	(OBConfirmationRequest 
		prompt: 'This will replace all applications on this server instance' 
		confirm: 'Proceed')
			ifFalse: [ ^ nil ].
	dispatcher := WADispatcher new.
	target adaptor requestHandler: dispatcher.
	requestor browser announce: (OBNodeCreated node: dispatcher asNode)