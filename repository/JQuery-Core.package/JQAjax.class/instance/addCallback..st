private
addCallback: callback

	self setUrl.
	self addParameter: (self renderContext callbacks
		store: callback).
