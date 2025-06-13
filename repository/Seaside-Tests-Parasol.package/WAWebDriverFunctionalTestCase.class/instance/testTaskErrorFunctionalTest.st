testing
testTaskErrorFunctionalTest

	| resultText |
	self selectTest: 'WATaskErrorFunctionalTest'.
	
	resultText := (driver findElementByTagName: 'h3') getText.
	self assert: resultText equals: 'Raise an exception?'.
			
	((driver findElementByClassName: 'dialog-button-yes') findElementByTagName: 'input') click.
	self workaroundChromeDriver.
	resultText := (driver findElementByTagName: 'h3') getText.
	self assert: ('Caught:*foo' match: resultText).
	
	((driver findElementByClassName: 'dialog-button-ok') findElementByTagName: 'input') click.
	self workaroundChromeDriver.
	resultText := (driver findElementByTagName: 'h3') getText.
	self assert: resultText equals: 'Raise an exception?'.
	
	((driver findElementByClassName: 'dialog-button-no') findElementByTagName: 'input') click.
	self workaroundChromeDriver.
	resultText := (driver findElementByTagName: 'h3') getText.
	self assert: resultText equals: 'Raise an exception?'.