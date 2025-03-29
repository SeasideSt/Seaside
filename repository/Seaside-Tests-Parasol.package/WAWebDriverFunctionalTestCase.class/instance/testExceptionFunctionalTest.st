testing
testExceptionFunctionalTest

	self selectTest: 'WAExceptionFunctionalTest'.

	(BPSelect on: (driver findElementByID: 'handlerselect')) selectByVisibleText: 'WAHtmlErrorHandler'.
	(driver findElementByID: #sethandler) click.

	(driver findElementByLinkText: 'Raise error') click.
	self assert: (driver findElementByTagName: 'h1') getText equals: 'WAError: Test Error'.
	self assert: (driver findElementByTagName: 'p') getText equals: 'Your request could not be completed. An exception occurred.'.
	driver goBack.
	
	((driver findElementsByCSSSelector: 'button[type=submit]') detect: [ :i | i getText = 'Raise error in POST' ]) click.
		"Webdriver suddenly stopped waiting for the page to navigate after submitting (March 2025)"
		"Discussion: https://groups.google.com/g/selenium-users/c/vfG6A6XVkA0/m/F351RKv5BAAJw"
		(Delay forMilliseconds: 500) wait.
	self assert: (driver findElementByTagName: 'h1') getText equals: 'WAError: Test Error'.
	self assert: (driver findElementByTagName: 'p') getText equals: 'Your request could not be completed. An exception occurred.'.
	driver goBack.

	self scrollWindowBy: 10@800 "need to scroll into view, especially when running headful".	
	(driver findElementByLinkText: 'Raise error during rendering') click.
	self assert: ((driver findElementsByTagName: 'h1') anySatisfy: [ :e | e getText = 'WAError: Error during rendering.' ]).
	self assert: ((driver findElementsByTagName: 'p') anySatisfy: [ :e | e getText = 'Your request could not be completed. An exception occurred.' ]).
	driver goBack.
	
	(driver findElementByLinkText: 'Raise zero divide') click.
	self assert: ((driver findElementByTagName: 'h1') getText includesSubstring: 'ZeroDivide').
	self assert: (driver findElementByTagName: 'p') getText equals: 'Your request could not be completed. An exception occurred.'.
	driver goBack.
	
	self scrollWindowBy: 10@800 "need to scroll into view, especially when running headful".
	(driver findElementByLinkText: 'Raise warning') click.
	self assert: (driver findElementByTagName: 'h1') getText equals: 'Warning: Test Warning'.
	self assert: (driver findElementByTagName: 'p') getText equals: 'Your request could not be completed. An exception occurred.'.
	driver goBack.

	self scrollWindowBy: 10@800 "need to scroll into view, especially when running headful".
	(driver findElementByLinkText: 'Raise deprecated') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'To be displayed'.
	((driver findElementsByCSSSelector: 'input[type=submit]') detect: [ :i | (i getAttribute: 'value') = 'Ok' ]) click.