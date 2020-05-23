tests-adding
testRawAddAllToPath
	url rawAddAllToPath: #('files/WAStandardFiles' 'seaside.jpg' ).
	self assert: url path size = 2.
	self assert: url path first = 'files/WAStandardFiles'.
	self assert: url path last = 'seaside.jpg'.
	self assert: url greaseString = '/files%2FWAStandardFiles/seaside.jpg'