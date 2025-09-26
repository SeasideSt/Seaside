callbacks
text: aBlock
	"Defines a text rendering callback."

	self dataType: 'text'.
	self enableCallbacks.
	callback := JQAjaxCallbackRespondText block: aBlock