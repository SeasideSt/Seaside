*jquery-json
json: aRenderable
	"Defines a json rendering callback."

	self dataType: 'json'.
	self addCallback: (JQAjaxCallbackRespondJSON renderable: aRenderable)