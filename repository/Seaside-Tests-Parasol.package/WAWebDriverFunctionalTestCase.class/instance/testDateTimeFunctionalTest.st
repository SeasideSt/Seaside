testing
testDateTimeFunctionalTest
	| dateTime inputs |
	self selectTest: 'WADateTimeFunctionalTest'.
	
	dateTime := DateAndTime midnight + (Time hour: 16 minute: 30 second: 10).
	
	(BPSelect on: ((driver findElementByID: #inputs) findElementByTagName: 'select')) selectByValue: dateTime monthIndex greaseString.
	inputs := ((driver findElementByID: #inputs) findElementsByCSSSelector: 'input[type=text]').
	(inputs at: 1) 
		sendKey: (BPKeys backSpace);
		sendKey: (BPKeys backSpace);
		sendKeys: dateTime dayOfMonth greaseString.
	(inputs at: 2) 
		sendKey: (BPKeys backSpace);
		sendKey: (BPKeys backSpace);
		sendKey: (BPKeys backSpace);
		sendKey: (BPKeys backSpace);
		sendKeys: dateTime year greaseString.
	(inputs at: 3) 
		sendKey: (BPKeys backSpace);
		sendKey: (BPKeys backSpace);
		sendKeys: dateTime asTime hour greaseString.
	(inputs at: 4) 
		sendKey: (BPKeys backSpace);
		sendKey: (BPKeys backSpace);
		sendKeys: dateTime asTime minutes greaseString.
	(inputs at: 5) 
		sendKey: (BPKeys backSpace);
		sendKey: (BPKeys backSpace);
		sendKeys: dateTime asTime seconds greaseString.
	((driver findElementByID: #inputs) findElementByCSSSelector: 'input[type=submit]') click.
		"Webdriver suddenly stopped waiting for the page to navigate after submitting (March 2025)"
		"Discussion: https://groups.google.com/g/selenium-users/c/vfG6A6XVkA0/m/F351RKv5BAAJw"
		(Delay forMilliseconds: 500) wait.

	self assert: ((driver findElementByID: #inputs) getText includesSubstring: 'Button action: ' , dateTime asDate greaseString , ' ' , dateTime asTime greaseString)