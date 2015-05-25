events
delegate: aSelectorString on: anEventString do: aHandlerObject
	"Attach a handler to the event anEventString for all elements which match the selector aSelectorString, now or in the future, based upon a specific set of root elements."
	
	self call: 'delegate' withArguments: (Array with: aSelectorString with: anEventString with: aHandlerObject asFunction)