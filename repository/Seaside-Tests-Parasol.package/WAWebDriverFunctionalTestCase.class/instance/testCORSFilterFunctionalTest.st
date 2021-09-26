testing
testCORSFilterFunctionalTest
	[ 
		WACORSResourceExample register; startAdaptors.
		
		self selectTest: 'WACORSFilterFunctionalTest'.
		
		self assert: (driver findElementByID: 'allowed-origins') getText equals: 'None'.
		(((driver findElementByID: 'get-requests') findElementsByTagName: 'button') 
			detect: [ :button | button getText = 'Same Origin' ]) click.
		self assert: ((driver findElementByID: 'result') findElementByTagName: 'p') getText equals: 'Success'.
		(((driver findElementByID: 'get-requests') findElementsByTagName: 'button') 
			detect: [ :button | button getText = 'Cross Origin' ]) click.
		self assert: ((driver findElementByID: 'result') findElementByTagName: 'p') getText equals: 'Error'.		
		
		((driver findElementsByTagName: 'button') detect: [ :button | button getText = 'Allow other origin' ]) click.
		(((driver findElementByID: 'get-requests') findElementsByTagName: 'button') 
			detect: [ :button | button getText = 'Same Origin' ]) click.
		self assert: ((driver findElementByID: 'result') findElementByTagName: 'p') getText equals: 'Success'.
		(((driver findElementByID: 'get-requests') findElementsByTagName: 'button') 
			detect: [ :button | button getText = 'Cross Origin' ]) click.
		self assert: ((driver findElementByID: 'result') findElementByTagName: 'p') getText equals: 'Success'.	
						
		"the following statement is to circumvent testing issue with the dev toolbar being over the delete buttons"
		(driver findElementByID: 'result') moveToElement.
		
		(((driver findElementByID: 'delete-requests') findElementsByTagName: 'button') 
			detect: [ :button | button getText = 'Same Origin' ]) click.
		self assert: ((driver findElementByID: 'result') findElementByTagName: 'p') getText equals: 'Success'.
		(((driver findElementByID: 'delete-requests') findElementsByTagName: 'button') 
			detect: [ :button | button getText = 'Cross Origin' ]) click.
		self assert: ((driver findElementByID: 'result') findElementByTagName: 'p') getText equals: 'Error'.		
		
		((driver findElementsByTagName: 'button') detect: [ :button | button getText = 'Allow DELETE' ]) click.

		"the following statement is to circumvent testing issue with the dev toolbar being over the delete buttons"
		(driver findElementByID: 'result') moveToElement.		
		
		(((driver findElementByID: 'delete-requests') findElementsByTagName: 'button') 
			detect: [ :button | button getText = 'Same Origin' ]) click.
		self assert: ((driver findElementByID: 'result') findElementByTagName: 'p') getText equals: 'Success'.
		(((driver findElementByID: 'delete-requests') findElementsByTagName: 'button') 
			detect: [ :button | button getText = 'Cross Origin' ]) click.
		self assert: ((driver findElementByID: 'result') findElementByTagName: 'p') getText equals: 'Success'.	
		
	] ensure: [ WACORSResourceExample unregister ]