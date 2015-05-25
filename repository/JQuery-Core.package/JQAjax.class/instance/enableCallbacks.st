private
enableCallbacks
	self hasCallback ifTrue: [ ^ self ].
	self url: self renderContext actionUrl withoutQuery withoutFragment.
	self addParameters: self renderContext actionUrl queryFields.
	self addParameter: (callbackId := self renderContext callbacks
		store: (JSAjaxCallback on: [ self processCallback ]))