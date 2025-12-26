callbacks
respond: aBlock
	"Defines a response callback."

	self enableCallbacks.
	callback := JQAjaxInternalCallbackRespond block: aBlock