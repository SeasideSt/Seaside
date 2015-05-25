accessing
event
	^ event ifNil: [ self defaultEvent ]