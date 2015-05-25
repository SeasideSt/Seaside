callbacks
callback: aBlock
	"Register aBlock as a primary callback of the receiver. It is only possible to have a single primary callback registered per instance. The primary callback must generate a response."

	self enableCallbacks.
	callback := aBlock fixCallbackTemps