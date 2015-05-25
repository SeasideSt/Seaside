tests-adding
testAddAllToPath
	url addAllToPath: #('files' 'WAStandardFiles' 'seaside.jpg' ).
	self assert: url path size = 3.
	self assert: url path first = 'files'.
	self assert: url path last = 'seaside.jpg'.
	self assert: url greaseString = '/files/WAStandardFiles/seaside.jpg'