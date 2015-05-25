accessing
options
	^ options ifNil: [ options := self defaultOptions ]