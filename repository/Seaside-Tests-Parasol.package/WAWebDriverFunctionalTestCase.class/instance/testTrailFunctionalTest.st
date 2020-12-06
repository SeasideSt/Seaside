testing
testTrailFunctionalTest
	| item3 currentItem |
	self selectTest: 'WATrailFunctionalTest'.
	
	self assert: ((driver findElementByClassName: 'trail') findElementsByClassName: 'separator') size equals: 0.
	(driver findElementByPartialLinkText: 'Call') click.
	self assert: ((driver findElementByClassName: 'trail') findElementsByClassName: 'separator') size equals: 1.
	(driver findElementByPartialLinkText: 'Call') click.
	self assert: ((driver findElementByClassName: 'trail') findElementsByClassName: 'separator') size equals: 2.

	item3 := ((driver findElementsByTagName: 'h1') select: [ :e | e getText beginsWith: 'Item' ]) first getText.

	(driver findElementByPartialLinkText: 'Call') click.
	self assert: ((driver findElementByClassName: 'trail') findElementsByClassName: 'separator') size equals: 3.
	
	currentItem := ((driver findElementsByTagName: 'h1') select: [ :e | e getText beginsWith: 'Item' ]) first.
	self assert: ((driver findElementByClassName: 'trail') getText splitOn: $>) last trimBoth equals: currentItem getText.
	
	(driver findElementByPartialLinkText: 'Answer') click.
	currentItem := ((driver findElementsByTagName: 'h1') select: [ :e | e getText beginsWith: 'Item' ]) first.
	self assert: item3 equals: currentItem getText.
	
	(driver findElementByPartialLinkText: 'Item 1') click.
	self assert: ((driver findElementByClassName: 'trail') findElementsByClassName: 'separator') size equals: 0.