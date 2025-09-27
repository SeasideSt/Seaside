private
setUrl

	(self options includesKey: 'url') ifTrue: [ ^ self ].
	self url: self renderContext actionUrl withoutQuery withoutFragment.
	self addParameters: self renderContext actionUrl queryFields.
