tests-adding
testAddToPathWithoutLeadingSlash
	url addToPath: 'files/WAStandardFiles/seaside.jpg'.
	self assert: url path size = 3.
	self assert: url path first = 'files'.
	self assert: url path second = 'WAStandardFiles'.
	self assert: url path third = 'seaside.jpg'.
	self assert: url greaseString = '/files/WAStandardFiles/seaside.jpg'