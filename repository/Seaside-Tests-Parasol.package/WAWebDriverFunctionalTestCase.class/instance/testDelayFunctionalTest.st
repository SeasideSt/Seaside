testing
testDelayFunctionalTest
	self selectTest: 'WADelayFunctionalTest'.

	self should: [ (driver findElementByTagName: 'h3') ] raise: BPNoSuchElementException.
	(driver findElementByPartialLinkText: 'Start') click.
	self assert: (driver findElementByTagName: 'h3') getText = '3 seconds'.
	(Delay forSeconds: 3) wait.
	self should: [ (driver findElementByTagName: 'h3') ] raise: BPNoSuchElementException.
	self shouldnt: [ driver findElementByPartialLinkText: 'Start' ] raise: BPNoSuchElementException