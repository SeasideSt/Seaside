callbacks
respond: aBlock
	"Defines a response callback."

	self enableCallbacks.
	callback := JQAjaxCallbackRespond block: aBlock