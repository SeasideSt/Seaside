testing
testDelegationFunctionalTest
	| step1aVisiblePresenters step1bVisiblePresenters step2VisiblePresenters |
	self selectTest: 'WADelegationFunctionalTest'.
	step1aVisiblePresenters := OrderedCollection new.
	step1bVisiblePresenters := OrderedCollection new.
	step2VisiblePresenters := OrderedCollection new.

	self assert: (driver findElementByTagName: 'h3') getText equals: 'Step 1'.
	(driver findElementByCSSSelector: 'input[type=submit][value=Ok]') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Step 2'.
	self componentUnderTest visiblePresentersDo: [ :presenter | step1aVisiblePresenters add: presenter ].
	
	driver goBack.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Step 1'.
	(driver findElementByCSSSelector: 'input[type=submit][value=Ok]') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Step 2'.
	self componentUnderTest visiblePresentersDo: [ :presenter | step1bVisiblePresenters add: presenter ].
	
	(driver findElementByCSSSelector: 'input[type=submit][value=Ok]') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Step 1'.
	self componentUnderTest visiblePresentersDo: [ :presenter | step2VisiblePresenters add: presenter ].


	"Needs work"
	self fail.

