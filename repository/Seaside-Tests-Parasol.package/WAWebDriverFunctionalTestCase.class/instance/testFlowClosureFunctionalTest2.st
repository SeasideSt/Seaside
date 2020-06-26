testing
testFlowClosureFunctionalTest2

	| okButton |
	self selectTest: 'WAFlowClosureFunctionalTest'.
	"Some weird behavior goes on when returning to the start of the functional test. Error in Seaside or... ??"
	okButton := [ (driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :e | (e getAttribute: 'value') = 'Ok' ] ].
	
	(driver findElementByPartialLinkText: 'Go') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: '1'.
	okButton value click.
	self assert: (driver findElementByTagName: 'h3') getText equals: '2'.
	driver goBack.
	self assert: (driver findElementByTagName: 'h3') getText equals: '1'.
	driver goBack.
	(driver findElementByPartialLinkText: 'Go') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: '1'.
	okButton value click.
	self assert: (driver findElementByTagName: 'h3') getText equals: '2'.
	driver goBack.
	self assert: (driver findElementByTagName: 'h3') getText equals: '1'.
	driver goBack.	
	(driver findElementByPartialLinkText: 'Go') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: '1'.
	okButton value click.
	self assert: (driver findElementByTagName: 'h3') getText equals: '2'.
	okButton value click.
	self assert: (driver findElementByTagName: 'h3') getText equals: '3'.
	okButton value click.
	self shouldnt: [ (driver findElementByPartialLinkText: 'Go') ] raise: BPNotFoundException