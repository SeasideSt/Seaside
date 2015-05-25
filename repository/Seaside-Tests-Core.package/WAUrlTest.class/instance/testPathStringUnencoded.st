tests-adding
testPathStringUnencoded
	self assert: url pathStringUnencoded = '/'.
	url addAllToPath: #('files' 'WAStandardFiles' 'seaside.jpg' ).
	self assert: url pathStringUnencoded = '/files/WAStandardFiles/seaside.jpg'.
	url slash: true.
	self assert: url pathStringUnencoded = '/files/WAStandardFiles/seaside.jpg/'