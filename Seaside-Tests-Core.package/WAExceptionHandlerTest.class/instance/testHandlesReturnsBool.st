testing
testHandlesReturnsBool
	self 
		assertHandles: WATestError new
		returnsSatisfying: [ :result | #(true false) includes: result ]