rendering
render: anObject
	^ String streamContents: [ :stream |
		self
			render: anObject
			on: stream ]