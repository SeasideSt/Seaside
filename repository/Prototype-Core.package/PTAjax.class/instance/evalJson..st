options
evalJson: aBoolean
	"Automatically evals the content of Ajax.Response#responseText and populates Ajax.Response#responseJSON with it if the content-type returned by the server is set to application/json. If the request doesn't obey SOP, the content is sanitized before evaluation. If you need to force evalutation, pass 'force'. To prevent it altogether, pass false."

	self options at: 'evalJSON' put: aBoolean