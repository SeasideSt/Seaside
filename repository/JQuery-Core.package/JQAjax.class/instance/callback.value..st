callbacks
callback: aBlock value: anObject
	"Register aBlock as a secondary callback. anObject is a reference to a Javascript object on the client-side. The object will be sent back to the server as a string and passed into aBlock. Multiple secondary callbacks can be defined with one receiver.

Note: anObject should be a single literal Javascript object (String, Number, Boolean). The object is transfered from client to server as the print-string of the object and passed into the callback block as a Smalltalk String."

	self enableCallbacks.
	self addParameter: (self renderContext callbacks
		store: (WAValueCallback on: aBlock)) 
			-> anObject