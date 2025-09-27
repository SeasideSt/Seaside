callbacks
text: aBlock
	"Defines a text rendering callback."

	self dataType: 'text'.
	self addCallback: (JQAjaxCallbackRespondText block: aBlock)