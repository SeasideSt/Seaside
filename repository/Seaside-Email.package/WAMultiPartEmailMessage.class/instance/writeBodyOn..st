writing
writeBodyOn: stream
	self parts asArray sort
		do: [ :eachPart | 
			self writeMiddleBoundaryOn: stream.
			eachPart writeOn: stream ].
	self writeEndBoundaryOn: stream