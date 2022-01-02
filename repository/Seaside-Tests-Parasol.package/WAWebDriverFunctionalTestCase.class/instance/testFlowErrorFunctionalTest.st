testing
testFlowErrorFunctionalTest

	self selectTest: 'WAFlowErrorFunctionalTest'.

	(BPSelect on: (driver findElementByID: 'handlerselect')) selectByVisibleText: 'WAHtmlErrorHandler'.
	(driver findElementByID: #sethandler) click.
	(driver findElementByLinkText: 'Raise error') click.
	self assert: (driver findElementByTagName: 'h1') getText = 'WAError: Test Error'.
	self assert: (driver findElementByTagName: 'p') getText = 'Your request could not be completed. An exception occurred.'.
	driver goBack.
	
	(driver findElementByLinkText: 'Raise error in called component') click.
	self assert: (driver findElementByTagName: 'h3') getText = 'Once you close this, an error will be raised.'.
	((driver findElementsByCSSSelector: 'input[type=submit]') detect: [ :i | (i getAttribute: 'value') = 'Ok' ]) click.
	
	self assert: (driver findElementByTagName: 'h1') getText = 'WAError: Test Error'.
	self assert: (driver findElementByTagName: 'p') getText = 'Your request could not be completed. An exception occurred.'.