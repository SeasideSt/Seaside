accessing
frequency
	^ frequency ifNil: [ frequency := self defaultFrequency ]