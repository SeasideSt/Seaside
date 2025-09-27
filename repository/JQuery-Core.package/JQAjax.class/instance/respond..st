callbacks
respond: aBlock
	"Defines a response callback."

	self enableCallbacks.
	self replaceCallbackBy: (JQAjaxCallbackRespond block: aBlock)