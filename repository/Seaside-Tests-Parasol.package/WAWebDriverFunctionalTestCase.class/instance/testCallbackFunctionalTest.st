testing
testCallbackFunctionalTest
	self selectTest: 'WACallbackFunctionalTest'.
	
	(driver findElementByCSSSelector: 'input[type=text]') sendKey: BPKeys enter.
	self assert: (driver findElementByTagName: 'pre') getText equals: ('Text: Some Text', Character lf greaseString,'Default').
	
	((driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :button | (button getAttribute: 'value') = 'Before' ]) click.
		"Webdriver suddenly stopped waiting for the page to navigate after submitting (March 2025)"
		"Discussion: https://groups.google.com/g/selenium-users/c/vfG6A6XVkA0/m/F351RKv5BAAJw"
		(Delay forMilliseconds: 500) wait.
	self assert: (driver findElementByTagName: 'pre') getText equals: 'Text: Some Text'.
	
	((driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :button | (button getAttribute: 'value') = 'Before Submit' ]) click.
		"Webdriver suddenly stopped waiting for the page to navigate after submitting (March 2025)"
		"Discussion: https://groups.google.com/g/selenium-users/c/vfG6A6XVkA0/m/F351RKv5BAAJw"
		(Delay forMilliseconds: 500) wait.
	self assert: (driver findElementByTagName: 'pre') getText equals: ('Text: Some Text', Character lf greaseString,'Before Submit').
	
	((driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :button | (button getAttribute: 'value') = 'Before Cancel' ]) click.
		"Webdriver suddenly stopped waiting for the page to navigate after submitting (March 2025)"
		"Discussion: https://groups.google.com/g/selenium-users/c/vfG6A6XVkA0/m/F351RKv5BAAJw"
		(Delay forMilliseconds: 500) wait.
	self assert: (driver findElementByTagName: 'pre') getText equals: 'Before Cancel'.
	
	((driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :button | (button getAttribute: 'value') = 'After' ]) click.
		"Webdriver suddenly stopped waiting for the page to navigate after submitting (March 2025)"
		"Discussion: https://groups.google.com/g/selenium-users/c/vfG6A6XVkA0/m/F351RKv5BAAJw"
		(Delay forMilliseconds: 500) wait.
	self assert: (driver findElementByTagName: 'pre') getText equals: 'Text: Some Text'.
	
	((driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :button | (button getAttribute: 'value') = 'After Submit' ]) click.
		"Webdriver suddenly stopped waiting for the page to navigate after submitting (March 2025)"
		"Discussion: https://groups.google.com/g/selenium-users/c/vfG6A6XVkA0/m/F351RKv5BAAJw"
		(Delay forMilliseconds: 500) wait.
	self assert: (driver findElementByTagName: 'pre') getText equals: ('Text: Some Text', Character lf greaseString,'After Submit').
	
	((driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :button | (button getAttribute: 'value') = 'After Cancel' ]) click.
		"Webdriver suddenly stopped waiting for the page to navigate after submitting (March 2025)"
		"Discussion: https://groups.google.com/g/selenium-users/c/vfG6A6XVkA0/m/F351RKv5BAAJw"
		(Delay forMilliseconds: 500) wait.
	self assert: (driver findElementByTagName: 'pre') getText equals: 'After Cancel'.