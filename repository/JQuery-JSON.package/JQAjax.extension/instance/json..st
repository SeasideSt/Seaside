*jquery-json
json: aRenderable
	"Defines a json rendering callback."

	self dataType: 'json'.
	self enableCallbacks.
	callback := JQAjaxInternalCallbackRespondJSON renderable: aRenderable