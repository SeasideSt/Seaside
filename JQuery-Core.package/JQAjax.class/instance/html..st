callbacks
html: aRenderable
	"Defines a html rendering callback."

	self dataType: 'html'.
	self respond: [ :response |
		response
			doNotCache;
			contentType: self application contentType.
		self render: aRenderable on: response stream ]