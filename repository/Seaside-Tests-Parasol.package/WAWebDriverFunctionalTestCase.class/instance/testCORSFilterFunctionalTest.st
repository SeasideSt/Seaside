testing
testCORSFilterFunctionalTest
	[ 
		WACORSResourceExample register; registerCorsAdaptor.
		
		self selectTest: 'WACORSFilterFunctionalTest'.
		
		self should: [ driver findElementByPartialLinkText: 'Register CORS Resource' ] raise: BPNoSuchElementException.

		self assert: (driver findElementByID: 'allowed-origins') getText equals: 'None'.
		(((driver findElementByID: 'get-requests') findElementsByTagName: 'button') detect: [ :button | button getText = 'Same Origin' ]) click.
		(Delay forMilliseconds: 300) wait.
		self assert: ((driver findElementByID: 'result') findElementByTagName: 'p') getText equals: 'Success'.
		
"		self clickRestart."
		(((driver findElementByID: 'get-requests') findElementsByTagName: 'button') detect: [ :button | button getText = 'Cross Origin' ]) click.
		(Delay forMilliseconds: 300) wait.
		self assert: ((driver findElementByID: 'result') findElementByTagName: 'p') getText equals: 'Error'.		

"		self clickRestart.		"
		((driver findElementsByTagName: 'button') detect: [ :button | button getText = 'Allow other origin' ]) click.
		(((driver findElementByID: 'get-requests') findElementsByTagName: 'button') detect: [ :button | button getText = 'Same Origin' ]) click.
  		(Delay forMilliseconds: 300) wait.
		self assert: ((driver findElementByID: 'result') findElementByTagName: 'p') getText equals: 'Success'.
		
"		self clickRestart.		"
		(((driver findElementByID: 'get-requests') findElementsByTagName: 'button') detect: [ :button | button getText = 'Cross Origin' ]) click.
	  	(Delay forMilliseconds: 300) wait.
		self assert: ((driver findElementByID: 'result') findElementByTagName: 'p') getText equals: 'Success'.	

		self clickRestart.
		"the following statement is to circumvent testing issue with the dev toolbar being over the delete buttons"
		(driver findElementByID: 'result') moveToElement.
		(((driver findElementByID: 'delete-requests') findElementsByTagName: 'button') detect: [ :button | button getText = 'Same Origin' ]) click.
	  	(Delay forMilliseconds: 1000) wait.
		self assert: ((driver findElementByID: 'result') findElementByTagName: 'p') getText equals: 'Success'.
		
		self clickRestart.
		"the following statement is to circumvent testing issue with the dev toolbar being over the delete buttons"
		(driver findElementByID: 'result') moveToElement.	
		(((driver findElementByID: 'delete-requests') findElementsByTagName: 'button') detect: [ :button | button getText = 'Cross Origin' ]) click.
	  	(Delay forMilliseconds: 300) wait.
		self assert: ((driver findElementByID: 'result') findElementByTagName: 'p') getText equals: 'Error'.		
		
		((driver findElementsByTagName: 'button') detect: [ :button | button getText = 'Allow DELETE' ]) click.

		self clickRestart.
		"the following statement is to circumvent testing issue with the dev toolbar being over the delete buttons"
		(driver findElementByID: 'result') moveToElement.		
		(((driver findElementByID: 'delete-requests') findElementsByTagName: 'button') 
			detect: [ :button | button getText = 'Same Origin' ]) click.
  		(Delay forMilliseconds: 300) wait.
		self assert: ((driver findElementByID: 'result') findElementByTagName: 'p') getText equals: 'Success'.

		self clickRestart.
		"the following statement is to circumvent testing issue with the dev toolbar being over the delete buttons"
		(driver findElementByID: 'result') moveToElement.				
		(((driver findElementByID: 'delete-requests') findElementsByTagName: 'button') detect: [ :button | button getText = 'Cross Origin' ]) click.
  		(Delay forMilliseconds: 300) wait.
		self assert: ((driver findElementByID: 'result') findElementByTagName: 'p') getText equals: 'Success'.	
		
	] ensure: [ WACORSResourceExample unregister; unregisterCorsAdaptor ]