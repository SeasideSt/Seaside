tests
testRendering
	| address |
	address := WAEmailAddress
		address: 'philippe.marschall@gmail.com'
		username: 'Philippe Marschall'.
	self assert: address address = 'philippe.marschall@gmail.com'.
	self assert: address username = 'Philippe Marschall'.
	self assert: (self render: address) = 'Philippe Marschall &lt;philippe.marschall@gmail.com&gt;'