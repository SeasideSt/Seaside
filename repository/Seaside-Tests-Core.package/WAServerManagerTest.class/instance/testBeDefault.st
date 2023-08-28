tests
testBeDefault

	| previous |
	previous := WAServerManager default.
	[ 
    	WATestServerManager beDefault.
    	self
		  assert: WAServerManager default class
		  equals: WATestServerManager
	 ] ensure: [ 
		WAServerManager setDefault: previous 
	 ]