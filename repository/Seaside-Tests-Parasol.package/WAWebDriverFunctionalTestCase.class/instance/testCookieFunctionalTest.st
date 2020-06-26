testing
testCookieFunctionalTest

	| firstRow secondRow |
	self selectTest: 'WACookieFunctionalTest'.
	
	firstRow := (driver findElementByID: #addFirstCookie) findElementByXPath: '../..'.
	(firstRow findElementsByTagName: 'input') first sendKeys: 'seaside'.
	(firstRow findElementsByTagName: 'input') second sendKeys: 'aubergine'.
	(driver findElementByID: #addFirstCookie) click.
	
	self assert: ((driver findElementsByTagName: 'tr') anySatisfy:[ :row | (row getText includesSubstring: 'seaside') & (row getText includesSubstring: 'aubergine') ]).
	
	firstRow := (driver findElementByID: #addFirstCookie) findElementByXPath: '../..'.
	(firstRow findElementsByTagName: 'input') first sendKeys: 'grease'.
	(firstRow findElementsByTagName: 'input') second sendKeys: 'monkey'.
	secondRow := (driver findElementByID: #addSecondCookie) findElementByXPath: '../..'.
	(secondRow findElementsByTagName: 'input') first sendKeys: 'parasol'.
	(secondRow findElementsByTagName: 'input') second sendKeys: 'sunscreen'.
	(driver findElementByID: #addSecondCookie) click.
	
	self assert: ((driver findElementsByTagName: 'tr') anySatisfy:[ :row | (row getText includesSubstring: 'parasol') & (row getText includesSubstring: 'sunscreen') ]).
	self assert: ((driver findElementsByTagName: 'tr') anySatisfy:[ :row | (row getText includesSubstring: 'grease') & (row getText includesSubstring: 'monkey') ]).
	
	(((driver findElementsByTagName: 'tr') detect:[ :row | (row getText includesSubstring: 'grease') & (row getText includesSubstring: 'monkey') ]) findElementByCSSSelector: 'input[type=submit]') click.
	self deny: ((driver findElementsByTagName: 'tr') anySatisfy:[ :row | (row getText includesSubstring: 'grease') & (row getText includesSubstring: 'monkey') ]).