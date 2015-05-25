actions
observe: anObservedObject on: anEventString do: aHandlerObject 
	"Define event handler aHandlerObject for anEventString."
	self 
		call: 'observe'
		withArguments: (Array 
				with: anObservedObject
				with: anEventString
				with: (aHandlerObject asFunction: #('event' )))