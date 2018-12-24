testing
testCallbackFunctionalTest
	self selectTest: 'WACallbackFunctionalTest'.
	
	(driver findElementByCSSSelector: 'input[type=text]') sendKey: BPKeys enter.
	self assert: (driver findElementByTagName: 'pre') getText = ('Text: Some Text', Character lf greaseString,'Default').
	
	((driver findElementsByCSSSelector: 'input[type=submit]') detect:[:button | (button getAttribute: 'value') = 'Before' ]) click.
	self assert: (driver findElementByTagName: 'pre') getText = 'Text: Some Text'.
	
	((driver findElementsByCSSSelector: 'input[type=submit]') detect:[:button | (button getAttribute: 'value') = 'Before Submit' ]) click.
	self assert: (driver findElementByTagName: 'pre') getText = ('Text: Some Text', Character lf greaseString,'Before Submit').
	
	((driver findElementsByCSSSelector: 'input[type=submit]') detect:[:button | (button getAttribute: 'value') = 'Before Cancel' ]) click.
	self assert: (driver findElementByTagName: 'pre') getText = 'Before Cancel'.
	
	((driver findElementsByCSSSelector: 'input[type=submit]') detect:[:button | (button getAttribute: 'value') = 'After' ]) click.
	self assert: (driver findElementByTagName: 'pre') getText = 'Text: Some Text'.
	
	((driver findElementsByCSSSelector: 'input[type=submit]') detect:[:button | (button getAttribute: 'value') = 'After Submit' ]) click.
	self assert: (driver findElementByTagName: 'pre') getText = ('Text: Some Text', Character lf greaseString,'After Submit').
	
	((driver findElementsByCSSSelector: 'input[type=submit]') detect:[:button | (button getAttribute: 'value') = 'After Cancel' ]) click.
	self assert: (driver findElementByTagName: 'pre') getText = 'After Cancel'.