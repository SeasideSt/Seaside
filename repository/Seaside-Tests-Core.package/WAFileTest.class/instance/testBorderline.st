tests
testBorderline
	file fileName: 'C'.
	self assert: file fileName = 'C'.
	file fileName: 'C:'.
	self assert: file fileName = 'C:'.
	file fileName: 'C:\'.
	self assert: file fileName = ''