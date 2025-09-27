callbacks
script: aBlock
	"Defines a script rendering callback."

	self dataType: 'script'.
	self addCallback: (JQAjaxCallbackRespondScript ajax: self block: aBlock)