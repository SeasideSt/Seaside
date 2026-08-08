accessing
report
	^ report ifNil: [ report := self buildReport ]