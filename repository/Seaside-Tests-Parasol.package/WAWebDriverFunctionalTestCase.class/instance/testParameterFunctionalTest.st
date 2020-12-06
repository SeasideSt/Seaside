testing
testParameterFunctionalTest

	self selectTest: 'WAParameterFunctionalTest'.
	
	((driver findElementsByCSSSelector: 'input[type="submit"]') detect: [ :e | (e getAttribute:'value') = 'run test' ]) click.
	self assert: (driver findElementByTagName: 'strong') getText equals: 'success'