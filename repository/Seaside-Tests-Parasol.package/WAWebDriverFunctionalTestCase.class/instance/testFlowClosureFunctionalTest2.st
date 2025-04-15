testing
testFlowClosureFunctionalTest2

	| doClickButton |
	self selectTest: 'WAFlowClosureFunctionalTest'.
	"Some weird behavior goes on when returning to the start of the functional test. Error in Seaside or... ??"
	doClickButton := [ 
		((driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :e | (e getAttribute: 'value') = 'Ok' ]) click.
		self workaroundChromeDriver. ].
	
	(driver findElementByPartialLinkText: 'Go') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: '1'.
	doClickButton value.
	self assert: (driver findElementByTagName: 'h3') getText equals: '2'.
	driver goBack.
	self assert: (driver findElementByTagName: 'h3') getText equals: '1'.
	driver goBack.
	(driver findElementByPartialLinkText: 'Go') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: '1'.
	doClickButton value.
	self assert: (driver findElementByTagName: 'h3') getText equals: '2'.
	driver goBack.
	self assert: (driver findElementByTagName: 'h3') getText equals: '1'.
	driver goBack.	
	(driver findElementByPartialLinkText: 'Go') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: '1'.
	doClickButton value.
	self assert: (driver findElementByTagName: 'h3') getText equals: '2'.
	doClickButton value.
	self assert: (driver findElementByTagName: 'h3') getText equals: '3'.
	doClickButton value.
	self shouldnt: [ (driver findElementByPartialLinkText: 'Go') ] raise: BPNotFoundException