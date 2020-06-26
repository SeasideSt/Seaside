testing
testBatchFunctionalTest
	self selectTest: 'WABatchFunctionalTest'.
	
	(driver findElementByPartialLinkText: 'S') click.
	self assert: ((driver findElementsByTagName: 'li') anySatisfy: [ :li | li getText = 'Stack' ]).
	
	(driver findElementByPartialLinkText: '<<') click.
	self assert: ((driver findElementsByTagName: 'li') anySatisfy: [ :li | li getText = 'RunArray' ]).