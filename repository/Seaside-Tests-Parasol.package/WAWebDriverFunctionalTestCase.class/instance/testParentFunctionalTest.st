testing
testParentFunctionalTest

	self selectTest: 'WAParentFunctionalTest'.
	
	(driver findElementByPartialLinkText: 'swap parent') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Test passes!'