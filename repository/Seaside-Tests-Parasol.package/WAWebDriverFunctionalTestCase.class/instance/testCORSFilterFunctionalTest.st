testing
testCORSFilterFunctionalTest

	"Due to a missing method in the test code on versions of Gemstone earlier than 3.7, we skip this test."
	self skipOnGemStone36 ifTrue: [ ^self ].

	[ 
		WACORSResourceExample register; registerCorsAdaptor.
		self selectTest: 'WACORSFilterFunctionalTest'.
		self should: [ driver findElementByPartialLinkText: 'Register CORS Resource' ] raise: BPNoSuchElementException.

		self assert: (driver findElementByID: 'allowed-origins') getText equals: 'None'.
		(((driver findElementByID: 'get-requests') findElementsByTagName: 'button') detect: [ :button | button getText = 'Same Origin' ]) moveToElement; click.
		self assert: self getCORSResultText equals: 'Success'.
		
		(((driver findElementByID: 'get-requests') findElementsByTagName: 'button') detect: [ :button | button getText = 'Cross Origin' ]) click.
		self assert: self getCORSResultText equals: 'Error'.

		"Now test with cross-origin allowed"
		((driver findElementsByTagName: 'button') detect: [ :button | button getText = 'Allow other origin' ]) click.

		(((driver findElementByID: 'get-requests') findElementsByTagName: 'button') detect: [ :button | button getText = 'Same Origin' ]) click.
		self assert: self getCORSResultText equals: 'Success'.
		
		(((driver findElementByID: 'get-requests') findElementsByTagName: 'button') detect: [ :button | button getText = 'Cross Origin' ]) click.
		self assert: self getCORSResultText equals: 'Success'.	

		"the following statement is to circumvent testing issue with the dev toolbar being over the delete buttons"
		(driver findElementByID: 'result') moveToElement.
		(((driver findElementByID: 'delete-requests') findElementsByTagName: 'button') detect: [ :button | button getText = 'Same Origin' ]) click.
		self assert: self getCORSResultText equals: 'Success'.
		
		"the following statement is to circumvent testing issue with the dev toolbar being over the delete buttons"
		(driver findElementByID: 'result') moveToElement.	
		(((driver findElementByID: 'delete-requests') findElementsByTagName: 'button') detect: [ :button | button getText = 'Cross Origin' ]) click.
		self assert: self getCORSResultText equals: 'Error'.	
		
		((driver findElementsByTagName: 'button') detect: [ :button | button getText = 'Allow DELETE' ]) click.

		"the following statement is to circumvent testing issue with the dev toolbar being over the delete buttons"
		(driver findElementByID: 'result') moveToElement.		
		(((driver findElementByID: 'delete-requests') findElementsByTagName: 'button') 
			detect: [ :button | button getText = 'Same Origin' ]) click.
		self assert: self getCORSResultText equals: 'Success'.

		"the following statement is to circumvent testing issue with the dev toolbar being over the delete buttons"
		(driver findElementByID: 'result') moveToElement.				
		(((driver findElementByID: 'delete-requests') findElementsByTagName: 'button') detect: [ :button | button getText = 'Cross Origin' ]) click.
		self assert: self getCORSResultText equals: 'Success'.	
		
	] ensure: [ WACORSResourceExample unregister; unregisterCorsAdaptor ]