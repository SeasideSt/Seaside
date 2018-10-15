accessing
frequency
	"the amount of time, in seconds, to wait in between callbacks"
 	^ frequency ifNil: [ frequency := self defaultFrequency ]