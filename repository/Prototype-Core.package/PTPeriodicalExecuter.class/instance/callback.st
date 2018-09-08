accessing
callback
	^ callback ifNil: [ callback := self defaultCallback ]