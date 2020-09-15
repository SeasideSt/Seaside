testing
testCallbackSecurityFunctionalTest
	self selectTest: 'WACallbackSecurityFunctionalTest'.
	
	self deny: ((driver findElementsByTagName: 'p') anySatisfy: [ :p | p getText = 'This should always be a NUMBER: 3' ]).
	self deny: ((driver findElementsByTagName: 'p') anySatisfy: [ :p | p getText = 'This should always be a LETTER: C' ]).
	
	(driver findElementByPartialLinkText: 'Try to break it') click.
	
	self assert: ((driver findElementsByTagName: 'p') anySatisfy: [ :p | p getText = 'This should always be a NUMBER: 3' ]).
	self assert: ((driver findElementsByTagName: 'p') anySatisfy: [ :p | p getText = 'This should always be a LETTER: C' ]).