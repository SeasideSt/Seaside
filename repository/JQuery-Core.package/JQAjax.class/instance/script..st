callbacks
script: aBlock
	"Defines a script rendering callback."

	self dataType: 'script'.
	self enableCallbacks.
	self replaceCallbackBy: (JQAjaxCallbackRespondScript ajax: self block: aBlock)