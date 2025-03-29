testing
testFlowClosureFunctionalTest

	| doClickButton |
	self selectTest: 'WAFlowClosureFunctionalTest'.
	
	doClickButton := [ (
		(driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :e | (e getAttribute: 'value') = 'Ok' ]) click.
		"Webdriver suddenly stopped waiting for the page to navigate after submitting (March 2025)"
		"Discussion: https://groups.google.com/g/selenium-users/c/vfG6A6XVkA0/m/F351RKv5BAAJw"
		(Delay forMilliseconds: 500) wait ].
	
	(driver findElementByPartialLinkText: 'Go') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: '1'.
	doClickButton value.
	self assert: (driver findElementByTagName: 'h3') getText equals: '2'.
	driver goBack.
	self assert: (driver findElementByTagName: 'h3') getText equals: '1'.
	doClickButton value.
	self assert: (driver findElementByTagName: 'h3') getText equals: '2'.
	doClickButton value.
	self assert: (driver findElementByTagName: 'h3') getText equals: '3'.
	doClickButton value.
	self shouldnt: [ (driver findElementByPartialLinkText: 'Go') ] raise: BPNotFoundException