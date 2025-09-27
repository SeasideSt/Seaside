callbacks
html: aRenderable
	"Defines a html rendering callback."

	self dataType: 'html'.
	self addCallback: (JQAjaxCallbackRespondHTML ajax: self renderable: aRenderable)