callbacks
script: aBlock
	"Defines a script rendering callback."

	self dataType: 'script'.
	self enableCallbacks.
	callback := JQAjaxCallbackRespondScript ajax: self block: aBlock