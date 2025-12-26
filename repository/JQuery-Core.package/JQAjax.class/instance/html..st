callbacks
html: aRenderable
	"Defines a html rendering callback."

	self dataType: 'html'.
	self enableCallbacks.
	callback := JQAjaxInternalCallbackRespondHTML ajax: self renderable: aRenderable