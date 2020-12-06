testing
testUrlDecodingFunctionalTest
	
	self selectTest: 'WAUrlDecodingFunctionalTest'.
	
	self assert: ((driver findElementsByTagName: 'h3') select:[ :e | e getText = 'Success!' ]) isEmpty.
	(driver findElementByPartialLinkText: 'Run Test') click.
	self assert: ((driver findElementsByTagName: 'h3') select:[ :e | e getText = 'Success!' ]) size equals: 1.
