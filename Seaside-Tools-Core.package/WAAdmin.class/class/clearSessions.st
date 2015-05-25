development
clearSessions
	self defaultServerManager adaptors do: [ :adaptor |
		adaptor requestHandler withDescendantsDo: [ :handler |
			handler isApplication ifTrue: [ handler clear ] ] ]