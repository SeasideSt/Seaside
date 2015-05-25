accessing-urls
javascriptUrl
	"Answer a Javascript expression that evaluates to the URL with all parameters attached."

	| stream |
	stream := JSStream new.
	stream javascript: self url.
	self data collection isEmpty ifFalse: [
		stream nextPutAll: '+"'.
		stream nextPut: (self url queryFields isEmpty
			ifTrue: [ $? ] ifFalse: [ $& ]).
		stream nextPutAll: '"+'; javascript: self data ].
	^ stream