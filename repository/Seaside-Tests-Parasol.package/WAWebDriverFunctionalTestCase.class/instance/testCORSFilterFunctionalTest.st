testing
testCORSFilterFunctionalTest
	[ 
		WACORSResourceExample register; registerCorsAdaptor.
		self selectTest: 'WACORSFilterFunctionalTest' 
		
	] ensure: [ WACORSResourceExample unregister ]