*jquery-json
json: aRenderable
	"Defines a json rendering callback."

	self dataType: 'json'.
	self enableCallbacks.
	self replaceCallbackBy: (JQAjaxCallbackRespondJSON renderable: aRenderable)