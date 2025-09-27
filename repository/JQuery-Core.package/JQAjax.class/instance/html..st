callbacks
html: aRenderable
	"Defines a html rendering callback."

	self dataType: 'html'.
	self enableCallbacks.
	self replaceCallbackBy: (JQAjaxCallbackRespondHTML ajax: self renderable: aRenderable)