accessing
currentPage
	^ currentPage ifNil: [ currentPage := self validPages first ]