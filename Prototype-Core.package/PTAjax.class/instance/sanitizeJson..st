options
sanitizeJson: aBoolean
	"Sanitizes the content of Ajax.Response#responseText before evaluating it."

	self options at: 'sanitizeJSON' put: aBoolean