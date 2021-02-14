Class {
	#name : #WAWebDriverFunctionalTestCase,
	#superclass : #WAWebDriverTestCase,
	#category : 'Seaside-Tests-Webdriver'
}

{ #category : #running }
WAWebDriverFunctionalTestCase >> componentClass [

	^ WAAllFunctionalTests 
]

{ #category : #helpers }
WAWebDriverFunctionalTestCase >> selectTest: aName [
	|select|
	
	select := BPSelect on: (driver findElementByCSSSelector: 'form>p>select').
	select selectByVisibleText: aName.
]

{ #category : #testing }
WAWebDriverFunctionalTestCase >> testBatchFunctionalTest [
	self selectTest: 'WABatchFunctionalTest'.
	
	(driver findElementByPartialLinkText: 'S') click.
	self assert: ((driver findElementsByTagName: 'li') anySatisfy: [ :li | li getText = 'Stack' ]).
	
	(driver findElementByPartialLinkText: '<<') click.
	self assert: ((driver findElementsByTagName: 'li') anySatisfy: [ :li | li getText = 'RunArray' ]).
]

{ #category : #testing }
WAWebDriverFunctionalTestCase >> testButtonFunctionalTest [
	self selectTest: 'WAButtonFunctionalTest'.
	
	(driver findElementByCSSSelector: 'input[type=text]') click.
	driver getKeyboard sendKeys: 'At the Seaside!'.
	
	self assert: (driver findElementByTagName: 'td') getText = 'a text'.	
	(driver findElementByCSSSelector: 'button[type=submit]') click.
	self assert: (driver findElementByTagName: 'td') getText = 'a textAt the Seaside!'.

	(driver findElementByCSSSelector: 'input[type=text]') click.
	driver getKeyboard sendKeys: (String with: BPKeys backSpace with: BPKeys backSpace).
	(driver findElementByCSSSelector: 'input[type=text]') getText = 'a textAt the Seasid'.
	(driver findElementByCSSSelector: 'button[type=reset]') click.
	(driver findElementByCSSSelector: 'input[type=text]') getText = 'a textAt the Seaside!'.
]

{ #category : #testing }
WAWebDriverFunctionalTestCase >> testCallbackFunctionalTest [
	self selectTest: 'WACallbackFunctionalTest'.
	
	(driver findElementByCSSSelector: 'input[type=text]') sendKey: BPKeys enter.
	self assert: (driver findElementByTagName: 'pre') getText = ('Text: Some Text', Character lf greaseString,'Default').
	
	((driver findElementsByCSSSelector: 'input[type=submit]') detect:[:button | (button getAttribute: 'value') = 'Before' ]) click.
	self assert: (driver findElementByTagName: 'pre') getText = 'Text: Some Text'.
	
	((driver findElementsByCSSSelector: 'input[type=submit]') detect:[:button | (button getAttribute: 'value') = 'Before Submit' ]) click.
	self assert: (driver findElementByTagName: 'pre') getText = ('Text: Some Text', Character lf greaseString,'Before Submit').
	
	((driver findElementsByCSSSelector: 'input[type=submit]') detect:[:button | (button getAttribute: 'value') = 'Before Cancel' ]) click.
	self assert: (driver findElementByTagName: 'pre') getText = 'Before Cancel'.
	
	((driver findElementsByCSSSelector: 'input[type=submit]') detect:[:button | (button getAttribute: 'value') = 'After' ]) click.
	self assert: (driver findElementByTagName: 'pre') getText = 'Text: Some Text'.
	
	((driver findElementsByCSSSelector: 'input[type=submit]') detect:[:button | (button getAttribute: 'value') = 'After Submit' ]) click.
	self assert: (driver findElementByTagName: 'pre') getText = ('Text: Some Text', Character lf greaseString,'After Submit').
	
	((driver findElementsByCSSSelector: 'input[type=submit]') detect:[:button | (button getAttribute: 'value') = 'After Cancel' ]) click.
	self assert: (driver findElementByTagName: 'pre') getText = 'After Cancel'.
]

{ #category : #testing }
WAWebDriverFunctionalTestCase >> testCallbackSecurityFunctionalTest [
	self selectTest: 'WACallbackSecurityFunctionalTest'.
	
	self deny: ((driver findElementsByTagName: 'p') anySatisfy: [ :p | p getText = 'This should always be a NUMBER: 3' ]).
	self deny: ((driver findElementsByTagName: 'p') anySatisfy: [ :p | p getText = 'This should always be a LETTER: C' ]).
	
	(driver findElementByPartialLinkText: 'Try to break it') click.
	
	self assert: ((driver findElementsByTagName: 'p') anySatisfy: [ :p | p getText = 'This should always be a NUMBER: 3' ]).
	self assert: ((driver findElementsByTagName: 'p') anySatisfy: [ :p | p getText = 'This should always be a LETTER: C' ]).
]

{ #category : #testing }
WAWebDriverFunctionalTestCase >> testCanvasTableFunctionalTest [
	| entities entitiesTable rows currencyTable headers entityHeaders exchangeRates |
	self selectTest: 'WACanvasTableFunctionalTest'.
	
	entityHeaders := #(
		('Character' 'Entity' 'Decimal' 'Hex' 'Rendering in Your Browser')
		('Entity' 'Decimal' 'Hex')).
	entities := { 
		#('non-breaking space' '&nbsp;' '&#160;' '&#xA0;' ' ' ' ' ' ') .
		#('ampersand' '&amp;' '&#38;' '&#x26;' '&' '&' '&') .
		#('less than sign' '&lt;' '&#60;' '&#x3C;' '<' '<' '<') .
		#('greater than sign' '&gt;' '&#62;' '&#x3E;' '>' '>' '>') .
		{ 'euro sign' . '&euro;' . '&#8364;' . '&#x20AC;' . (String with: Character euro) . (String with: Character euro) . (String with: Character euro) }
	}.
	
	entitiesTable := (driver findElementsByTagName: 'table') detect:[:table | (table findElementByTagName: 'caption') getText = 'HTML 4.0 entities' ].
	headers := entitiesTable findElementsByCSSSelector: 'thead tr'.
	headers with: entityHeaders do:[:header :headerDef |
		self assert: ((header findElementsByTagName: 'th') collect: #getText) equals: headerDef ].
	rows := entitiesTable findElementsByCSSSelector: 'tbody tr'.
	rows with: entities do:[:row :entityDef |
		self assert: ((row findElementsByTagName: 'td') collect: #getText) equals: entityDef ].
	
	exchangeRates := #(
		('EUR' '1.7')
		('USD' '1.3')
		('DKK' '23.36')
		('SEK' '19.32')
	).
	
	currencyTable := (driver findElementsByTagName: 'table') detect:[:table | (table findElementByTagName: 'caption') getText = 'Currencies against Swiss Franc (CHF)' ].
	rows := currencyTable findElementsByCSSSelector: 'tbody tr'.
	rows with: exchangeRates do:[:row :entityDef |
		self assert: ((row findElementByTagName: 'th') getText) equals: entityDef first.
		self assert: ((row findElementByTagName: 'td') getText) equals: entityDef second.].
]

{ #category : #testing }
WAWebDriverFunctionalTestCase >> testCanvasTagFunctionalTest [
	|  |
	self selectTest: 'WACanvasTagTest'.
	"Can only test if this does not crash"
	driver findElementByID: #tutorial.
	(driver findElementsByTagName: 'script') anySatisfy: [:script | script getText = 'drawShape()' ].
]

{ #category : #testing }
WAWebDriverFunctionalTestCase >> testContextFunctionalTest [

	self selectTest: 'WAContextFunctionalTest'.
	
	self fail.
]

{ #category : #testing }
WAWebDriverFunctionalTestCase >> testCookieFunctionalTest [

	| firstRow secondRow |
	self selectTest: 'WACookieFunctionalTest'.
	
	firstRow := (driver findElementByID: #addFirstCookie) findElementByXPath: '../..'.
	(firstRow findElementsByTagName: 'input') first sendKeys: 'seaside'.
	(firstRow findElementsByTagName: 'input') second sendKeys: 'aubergine'.
	(driver findElementByID: #addFirstCookie) click.
	
	self assert: ((driver findElementsByTagName: 'tr') anySatisfy:[:row | (row getText includesSubstring: 'seaside') & (row getText includesSubstring: 'aubergine') ]).
	
	firstRow := (driver findElementByID: #addFirstCookie) findElementByXPath: '../..'.
	(firstRow findElementsByTagName: 'input') first sendKeys: 'grease'.
	(firstRow findElementsByTagName: 'input') second sendKeys: 'monkey'.
	secondRow := (driver findElementByID: #addSecondCookie) findElementByXPath: '../..'.
	(secondRow findElementsByTagName: 'input') first sendKeys: 'parasol'.
	(secondRow findElementsByTagName: 'input') second sendKeys: 'sunscreen'.
	(driver findElementByID: #addSecondCookie) click.
	
	self assert: ((driver findElementsByTagName: 'tr') anySatisfy:[:row | (row getText includesSubstring: 'parasol') & (row getText includesSubstring: 'sunscreen') ]).
	self assert: ((driver findElementsByTagName: 'tr') anySatisfy:[:row | (row getText includesSubstring: 'grease') & (row getText includesSubstring: 'monkey') ]).
	
	(((driver findElementsByTagName: 'tr') detect:[:row | (row getText includesSubstring: 'grease') & (row getText includesSubstring: 'monkey') ]) findElementByCSSSelector: 'input[type=submit]') click.
	self deny: ((driver findElementsByTagName: 'tr') anySatisfy:[:row | (row getText includesSubstring: 'grease') & (row getText includesSubstring: 'monkey') ]).
]

{ #category : #testing }
WAWebDriverFunctionalTestCase >> testDateSelectorFunctionalTest [

	| fromDate toDate fromDateSelects toDateSelects fromTime toTime fromTimeSelects toTimeSelects deltaTime fromDateAndTime deltaDuration toDateAndTime fromDateAndTimeSelects toDateAndTimeSelects |
	self selectTest: 'WADateSelectorFunctionalTest'.
	
	fromDate := Date today.
	toDate := Date today addDays: 300.
	
	fromDateSelects := (((driver findElementByID: #dateForm) findElementByClassName: 'from') findElementsByTagName: 'select').
	(BPSelect on: (fromDateSelects at: 1)) selectByValue: fromDate monthIndex greaseString.
	(BPSelect on: (fromDateSelects at: 2)) selectByVisibleText: fromDate dayOfMonth greaseString.
	(BPSelect on: (fromDateSelects at: 3)) selectByVisibleText: fromDate year greaseString.

	toDateSelects := (((driver findElementByID: #dateForm) findElementByClassName: 'to') findElementsByTagName: 'select').
	(BPSelect on: (toDateSelects at: 1)) selectByValue: toDate monthIndex greaseString.
	(BPSelect on: (toDateSelects at: 2)) selectByVisibleText: toDate dayOfMonth greaseString.
	(BPSelect on: (toDateSelects at: 3)) selectByVisibleText: toDate year greaseString.

	(((driver findElementByID: #dateForm) findElementByXPath: './ancestor-or-self::form') findElementByCSSSelector: 'input[type=submit]') click.
	self assert: ((driver findElementByTagName:'h3') getText includesSubstring: '300 day(s)').
	(driver findElementByCSSSelector: 'input[type=submit]') click.
	
	fromTime := Time now.
	deltaTime := Time hour: 4 minute: 30 second: 10.
	toTime := fromTime addTime: deltaTime.
	
	fromTimeSelects := (((driver findElementByID: #timeForm) findElementByClassName: 'from') findElementsByTagName: 'select').
	(BPSelect on: (fromTimeSelects at: 1)) selectByVisibleText: fromTime hour greaseString.
	(BPSelect on: (fromTimeSelects at: 2)) selectByVisibleText: fromTime minutes greaseString.
	(BPSelect on: (fromTimeSelects at: 3)) selectByVisibleText: fromTime seconds greaseString.
	
	toTimeSelects := (((driver findElementByID: #timeForm) findElementByClassName: 'to') findElementsByTagName: 'select').
	(BPSelect on: (toTimeSelects at: 1)) selectByVisibleText: toTime hour greaseString.
	(BPSelect on: (toTimeSelects at: 2)) selectByVisibleText: toTime minutes greaseString.
	(BPSelect on: (toTimeSelects at: 3)) selectByVisibleText: toTime seconds greaseString.
	
	(((driver findElementByID: #timeForm) findElementByXPath: './ancestor-or-self::form') findElementByCSSSelector: 'input[type=submit]') click.
	self assert: ((driver findElementByTagName:'h3') getText includesSubstring: deltaTime asSeconds greaseString,' second(s)').
	(driver findElementByCSSSelector: 'input[type=submit]') click.
	
	fromDateAndTime := DateAndTime now.
	deltaDuration := Duration days: 10 hours: 4 minutes: 30 seconds: 10.
	toDateAndTime := fromDateAndTime + deltaDuration.
	
	fromDateAndTimeSelects := (((driver findElementByID: #dateTimeForm) findElementByClassName: 'from') findElementsByTagName: 'select').
	(BPSelect on: (fromDateAndTimeSelects at: 1)) selectByValue: fromDateAndTime monthIndex greaseString.
	(BPSelect on: (fromDateAndTimeSelects at: 2)) selectByVisibleText: fromDateAndTime dayOfMonth greaseString.
	(BPSelect on: (fromDateAndTimeSelects at: 3)) selectByVisibleText: fromDateAndTime year greaseString.
	(BPSelect on: (fromDateAndTimeSelects at: 4)) selectByVisibleText: fromDateAndTime asTime hour greaseString.
	(BPSelect on: (fromDateAndTimeSelects at: 5)) selectByVisibleText: fromDateAndTime asTime minutes greaseString.
	(BPSelect on: (fromDateAndTimeSelects at: 6)) selectByVisibleText: fromDateAndTime asTime seconds greaseString.
	
	toDateAndTimeSelects := (((driver findElementByID: #dateTimeForm) findElementByClassName: 'to') findElementsByTagName: 'select').
	(BPSelect on: (toDateAndTimeSelects at: 1)) selectByValue: toDateAndTime monthIndex greaseString.
	(BPSelect on: (toDateAndTimeSelects at: 2)) selectByVisibleText: toDateAndTime dayOfMonth greaseString.
	(BPSelect on: (toDateAndTimeSelects at: 3)) selectByVisibleText: toDateAndTime year greaseString.
	(BPSelect on: (toDateAndTimeSelects at: 4)) selectByVisibleText: toDateAndTime asTime hour greaseString.
	(BPSelect on: (toDateAndTimeSelects at: 5)) selectByVisibleText: toDateAndTime asTime minutes greaseString.
	(BPSelect on: (toDateAndTimeSelects at: 6)) selectByVisibleText: toDateAndTime asTime seconds greaseString.
]

{ #category : #testing }
WAWebDriverFunctionalTestCase >> testDateTimeFunctionalTest [
	| dateTime inputs |
	self selectTest: 'WADateTimeFunctionalTest'.
	
	dateTime := DateAndTime midnight + (Time hour: 16 minute: 30 second: 10).
	
	(BPSelect on: ((driver findElementByID: #inputs) findElementByTagName: 'select')) selectByValue: dateTime monthIndex greaseString.
	inputs := ((driver findElementByID: #inputs) findElementsByCSSSelector: 'input[type=text]').
	(inputs at: 1) 
		sendKey: (BPKeys backSpace);
		sendKey: (BPKeys backSpace);
		sendKeys: dateTime dayOfMonth greaseString.
	(inputs at: 2) 
		sendKey: (BPKeys backSpace);
		sendKey: (BPKeys backSpace);
		sendKey: (BPKeys backSpace);
		sendKey: (BPKeys backSpace);
		sendKeys: dateTime year greaseString.
	(inputs at: 3) 
		sendKey: (BPKeys backSpace);
		sendKey: (BPKeys backSpace);
		sendKeys: dateTime asTime hour greaseString.
	(inputs at: 4) 
		sendKey: (BPKeys backSpace);
		sendKey: (BPKeys backSpace);
		sendKeys: dateTime asTime minutes greaseString.
	(inputs at: 5) 
		sendKey: (BPKeys backSpace);
		sendKey: (BPKeys backSpace);
		sendKeys: dateTime asTime seconds greaseString.
	((driver findElementByID: #inputs) findElementByCSSSelector: 'input[type=submit]') click.

	self assert: ((driver findElementByID: #inputs) getText includesSubstring: 'Button action: ' , dateTime asDate greaseString , ' ' , dateTime asTime greaseString)
]

{ #category : #testing }
WAWebDriverFunctionalTestCase >> testDelayFunctionalTest [
	self selectTest: 'WADelayFunctionalTest'.

	self should: [ (driver findElementByTagName: 'h3') ] raise: BPNoSuchElementException.
	(driver findElementByPartialLinkText: 'Start') click.
	self assert: (driver findElementByTagName: 'h3') getText = '3 seconds'.
	(Delay forSeconds: 3) wait.
	self should: [ (driver findElementByTagName: 'h3') ] raise: BPNoSuchElementException.
	self shouldnt: [ driver findElementByPartialLinkText: 'Start' ] raise: BPNoSuchElementException
]

{ #category : #testing }
WAWebDriverFunctionalTestCase >> testDelegationFunctionalTest [
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


]

{ #category : #testing }
WAWebDriverFunctionalTestCase >> testEncodingFunctionalTest [

	self selectTest: 'WAEncodingFunctionalTest'.
	
	self fail.
]

{ #category : #testing }
WAWebDriverFunctionalTestCase >> testExceptionFunctionalTest [

	self selectTest: 'WAExceptionFunctionalTest'.
	
	self fail.
]

{ #category : #testing }
WAWebDriverFunctionalTestCase >> testExpiryFunctionalTest [

	self selectTest: 'WAExpiryFunctionalTest'.
	
	self fail.
]

{ #category : #testing }
WAWebDriverFunctionalTestCase >> testFilterFunctionalTest [

	self selectTest: 'WAFilterFunctionalTest'.
	
	self fail.
]

{ #category : #testing }
WAWebDriverFunctionalTestCase >> testFlowConvenienceFunctionalTest [

	self selectTest: 'WAFlowConvenienceFunctionalTest'.
	self fail.
	"(BPSelect on: (driver findElementsByTagName: 'select')) selectByValue: dateTime monthIndex greaseString."
]
