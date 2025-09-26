callbacks
html: aRenderable
	"Defines a html rendering callback."

	self dataType: 'html'.
	self enableCallbacks.
	callback := JQAjaxCallbackRespondHTML ajax: self renderable: aRenderable