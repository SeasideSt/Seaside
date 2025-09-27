callbacks
respond: aBlock
	"Defines a response callback."

	self addCallback: (JQAjaxCallbackRespond block: aBlock)