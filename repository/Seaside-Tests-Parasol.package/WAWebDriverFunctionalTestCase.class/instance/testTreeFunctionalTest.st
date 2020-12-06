testing
testTreeFunctionalTest
	
	self selectTest: 'WATreeFunctionalTest'.
	
	self deny: (driver findElementByID: 'selecteditem') getText = 'Collection'.
	(driver findElementByPartialLinkText: 'Collection') click.
	self assert: (driver findElementByID: 'selecteditem') getText equals: 'Collection'.

	self should: [ (driver findElementByPartialLinkText: 'SequenceableCollection') ] raise: BPNoSuchElementException.
	(driver findElementByPartialLinkText: '+') click.
	
	(driver findElementByPartialLinkText: 'SequenceableCollection') click.
	self assert: (driver findElementByID: 'selecteditem') getText equals: 'SequenceableCollection'.
	
	((driver findElementByPartialLinkText: 'SequenceableCollection') findElementByXPath: '../../span[contains(@class, ''button'')]') click.
	
	self assert: ((driver findElementsByClassName: 'label') anySatisfy: [ :e | e getText = 'Interval' ]).
	self should: [ (driver findElementByPartialLinkText: 'Interval') ] raise: BPNoSuchElementException.
	
	((driver findElementByPartialLinkText: 'SequenceableCollection') findElementByXPath: '../../span[contains(@class, ''button'')]') click.
	self assert: ((driver findElementsByClassName: 'label') noneSatisfy: [ :e | e getText = 'Interval' ])
	