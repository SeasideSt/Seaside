testing
testHomeFunctionalTest

	self selectTest: 'WAHomeFunctionalTest'.
	
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Root Component'.
	(driver findElementByPartialLinkText: 'home') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Root Component'.
	(driver findElementByPartialLinkText: 'call') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Called Component'.
	(driver findElementByPartialLinkText: 'call') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Called Component'.
	(driver findElementByPartialLinkText: 'home') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Root Component'.
	(driver findElementByPartialLinkText: 'call') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Called Component'.
	(driver findElementByPartialLinkText: 'home') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Root Component'.
	(driver findElementByPartialLinkText: 'home') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Root Component'.
	(driver findElementByPartialLinkText: 'call') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Called Component'.
	(driver findElementByPartialLinkText: 'home') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Root Component'.