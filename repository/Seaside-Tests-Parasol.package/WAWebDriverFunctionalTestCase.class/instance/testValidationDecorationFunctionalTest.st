testing
testValidationDecorationFunctionalTest

	self selectTest: 'WAValidationDecorationFunctionalTest'.
	
	(driver findElementsByPartialLinkText: 'Start') first click.
	self deny: ((driver findElementByTagName: 'body') getText includes: 'Validation Failed!').

	(driver findElementsByPartialLinkText: 'Fail validation') first click.
	self assert: (driver findElementByClassName: 'validation-error') getText equals: 'Validation Failed!'.
	
	(driver findElementsByPartialLinkText: 'Succeed validation') first click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Validation Succeeded!'.
	
	((driver findElementsByTagName: 'input') detect:[ :e | (e getAttribute:'value') = 'Ok' ]) click.
	self assert: (driver findElementsByPartialLinkText: 'Start') notEmpty