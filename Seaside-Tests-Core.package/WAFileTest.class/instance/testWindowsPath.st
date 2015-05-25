tests
testWindowsPath
	file fileName: 'C:\important\passwords.txt'.
	self assert: file fileName = 'passwords.txt'.
	file fileName: '/important/passwords.txt'.
	self assert: file fileName = '/important/passwords.txt'.
	file fileName: 'passwords.txt'.
	self assert: file fileName = 'passwords.txt'