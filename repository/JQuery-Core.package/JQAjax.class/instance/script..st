callbacks
script: aBlock
	"Defines a script rendering callback."

	self dataType: 'script'.
	self enableCallbacks.
	callback := JQAjaxInternalCallbackRespondScript ajax: self block: aBlock