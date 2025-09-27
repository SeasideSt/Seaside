callbacks
text: aBlock
	"Defines a text rendering callback."

	self dataType: 'text'.
	self enableCallbacks.
	self replaceCallbackBy: (JQAjaxCallbackRespondText block: aBlock)