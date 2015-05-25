tests-adding
testAddField
	url addField: 'x'.
	self assert: url greaseString = '/?x'.
	url addField: 'y'.
	self assert: url greaseString = '/?x&y'.
	url addField: 'x'.
	self assert: url greaseString = '/?x&y&x'