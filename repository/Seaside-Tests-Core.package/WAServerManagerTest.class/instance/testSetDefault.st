tests
testSetDefault

	| previous |
	previous := WAServerManager default.
	[ 
		WAServerManager setDefault: WATestServerManager new.
		self
			assert: WAServerManager default class
			equals: WATestServerManager
	] ensure: [ 
		WAServerManager setDefault: previous
	]