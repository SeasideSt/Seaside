Class {
	#name : 'WAWebDriverFunctionalTestCase',
	#superclass : 'WAWebDriverTestCase',
	#category : 'Seaside-Tests-Parasol',
	#package : 'Seaside-Tests-Parasol'
}

{ #category : 'helpers' }
WAWebDriverFunctionalTestCase >> clickElement: aBPWebElement [
	(BPActions driver: driver)
		moveToElement: aBPWebElement;
		click;
		perform.
]

{ #category : 'helpers' }
WAWebDriverFunctionalTestCase >> clickRestart [

	| button |
	button := driver findElementByCSSSelector: 'input[type="submit"]'.
	self assert: (button getAttribute: 'value') equals: 'Restart'.
	button click
]

{ #category : 'running' }
WAWebDriverFunctionalTestCase >> componentClass [

	^ WAAllFunctionalTests
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> expectedFailures [
	| todo |
	todo := #(testExpiryFunctionalTest testFilterFunctionalTest).
	^ (GRPlatform current class == (Smalltalk at: #GRGemStonePlatform ifAbsent:[ nil ]))
		ifTrue: [ #(testUploadFunctionalTestWithStreamingUploads testContextFunctionalTest), todo ]
		ifFalse:[  todo ]
]

{ #category : 'helpers' }
WAWebDriverFunctionalTestCase >> getCORSResultText [

	(Delay forMilliseconds: 300) wait.
	^ self waitUntilNoBPNoSuchElementExceptionIn: [ ((driver findElementByID: 'result') findElementByTagName: 'p') getText ]
]

{ #category : 'private' }
WAWebDriverFunctionalTestCase >> performTest [
	"The code below can be uncommented to take screenshots of failing tests which will be collected by the Github CI action.
	It is commented because it breaks Squeak and GemStone builds. Only works for Pharo builds."

 	^ super performTest
	"^ [ super performTest ] on: TestFailure , Error do: [ :exceptionTest |
			[ Transcript show: 'Taking screenshot to ', (FileLocator imageDirectory asFileReference) asString. self takeScreenshot ] on: Error do: [ :errorScreenshot |
				Transcript
					show: ('Could not take screenshot in {1}: {2}' format: {
						self asString.
						errorScreenshot messageText });
					cr ].
		exceptionTest pass ]"
]

{ #category : 'helpers' }
WAWebDriverFunctionalTestCase >> scrollWindowBy: distancePoint [

	driver executeScript: 'window.scrollBy(arguments[0], arguments[1])'
		with: { distancePoint x. distancePoint y }.
]

{ #category : 'helpers' }
WAWebDriverFunctionalTestCase >> selectTest: aName [
	| select |
	select := BPSelect on: (driver findElementByCSSSelector: 'form>p>select').
	select selectByVisibleText: aName.
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testBatchFunctionalTest [
	self selectTest: 'WABatchFunctionalTest'.
	
	(driver findElementByPartialLinkText: 'S') click.
	self assert: ((driver findElementsByTagName: 'li') anySatisfy: [ :li | li getText = 'Set' ]).
	
	(driver findElementByPartialLinkText: '<<') click.
	self assert: ((driver findElementsByTagName: 'li') anySatisfy: [ :li | li getText = 'RunArray' ]).
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testButtonFunctionalTest [
	| inputValue textValue |
	self selectTest: 'WAButtonFunctionalTest'.

	"Push submit"	
	(driver findElementByCSSSelector: 'input[type=text]') click.
	driver getKeyboard sendKeys: 'At the Seaside!'.
	self assert: (driver findElementByTagName: 'td') getText equals: 'a text'.	
	(driver findElementByCSSSelector: 'button[type=submit]') click.
	self assert: (driver findElementByTagName: 'td') getText equals: 'a textAt the Seaside!'.

	"Push reset"
	self assert: ((driver findElementByCSSSelector: 'input[type=text]') getProperty: 'value') equals: 'a textAt the Seaside!'.
	(driver findElementByCSSSelector: 'input[type=text]') click.
	driver getKeyboard sendKeys: 'blabla'.
	self assert: ((driver findElementByCSSSelector: 'input[type=text]') getProperty: 'value') ~= 'a textAt the Seaside!'.
	(driver findElementByCSSSelector: 'button[type=reset]') click.
	self assert: ((driver findElementByCSSSelector: 'input[type=text]') getAttribute:'value') equals: 'a textAt the Seaside!'.
	
	"Push push"
	(driver findElementByCSSSelector: 'input[type=text]') click.
	driver getKeyboard sendKeys: 'blabla'.
	inputValue := (driver findElementByCSSSelector: 'input[type=text]') getProperty: 'value'.
	textValue := (driver findElementByTagName: 'td') getText.
	self assert: (inputValue ~= textValue).
	(driver findElementByCSSSelector: 'button[type=button]') click.
	self assert: ((driver findElementByCSSSelector: 'input[type=text]') getProperty: 'value') equals: inputValue.
	self assert: (driver findElementByTagName: 'td') getText equals: textValue
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testCORSFilterFunctionalTest [
	[ 
		WACORSResourceExample register; registerCorsAdaptor.
		self selectTest: 'WACORSFilterFunctionalTest'.
		self should: [ driver findElementByPartialLinkText: 'Register CORS Resource' ] raise: BPNoSuchElementException.

		self assert: (driver findElementByID: 'allowed-origins') getText equals: 'None'.
		(((driver findElementByID: 'get-requests') findElementsByTagName: 'button') detect: [ :button | button getText = 'Same Origin' ]) click.
		self assert: self getCORSResultText equals: 'Success'.
		
		(((driver findElementByID: 'get-requests') findElementsByTagName: 'button') detect: [ :button | button getText = 'Cross Origin' ]) click.
		self assert: self getCORSResultText equals: 'Error'.

		"Now test with cross-origin allowed"
		((driver findElementsByTagName: 'button') detect: [ :button | button getText = 'Allow other origin' ]) click.

		(((driver findElementByID: 'get-requests') findElementsByTagName: 'button') detect: [ :button | button getText = 'Same Origin' ]) click.
		self assert: self getCORSResultText equals: 'Success'.
		
		(((driver findElementByID: 'get-requests') findElementsByTagName: 'button') detect: [ :button | button getText = 'Cross Origin' ]) click.
		self assert: self getCORSResultText equals: 'Success'.	

		"the following statement is to circumvent testing issue with the dev toolbar being over the delete buttons"
		(driver findElementByID: 'result') moveToElement.
		(((driver findElementByID: 'delete-requests') findElementsByTagName: 'button') detect: [ :button | button getText = 'Same Origin' ]) click.
		self assert: self getCORSResultText equals: 'Success'.
		
		"the following statement is to circumvent testing issue with the dev toolbar being over the delete buttons"
		(driver findElementByID: 'result') moveToElement.	
		(((driver findElementByID: 'delete-requests') findElementsByTagName: 'button') detect: [ :button | button getText = 'Cross Origin' ]) click.
		self assert: self getCORSResultText equals: 'Error'.	
		
		((driver findElementsByTagName: 'button') detect: [ :button | button getText = 'Allow DELETE' ]) click.

		"the following statement is to circumvent testing issue with the dev toolbar being over the delete buttons"
		(driver findElementByID: 'result') moveToElement.		
		(((driver findElementByID: 'delete-requests') findElementsByTagName: 'button') 
			detect: [ :button | button getText = 'Same Origin' ]) click.
		self assert: self getCORSResultText equals: 'Success'.

		"the following statement is to circumvent testing issue with the dev toolbar being over the delete buttons"
		(driver findElementByID: 'result') moveToElement.				
		(((driver findElementByID: 'delete-requests') findElementsByTagName: 'button') detect: [ :button | button getText = 'Cross Origin' ]) click.
		self assert: self getCORSResultText equals: 'Success'.	
		
	] ensure: [ WACORSResourceExample unregister; unregisterCorsAdaptor ]
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testCallbackFunctionalTest [
	self selectTest: 'WACallbackFunctionalTest'.
	
	(driver findElementByCSSSelector: 'input[type=text]') sendKey: BPKeys enter.
	self assert: (driver findElementByTagName: 'pre') getText equals: ('Text: Some Text', Character lf greaseString,'Default').
	
	((driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :button | (button getAttribute: 'value') = 'Before' ]) click.
	self assert: (driver findElementByTagName: 'pre') getText equals: 'Text: Some Text'.
	
	((driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :button | (button getAttribute: 'value') = 'Before Submit' ]) click.
	self assert: (driver findElementByTagName: 'pre') getText equals: ('Text: Some Text', Character lf greaseString,'Before Submit').
	
	((driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :button | (button getAttribute: 'value') = 'Before Cancel' ]) click.
	self assert: (driver findElementByTagName: 'pre') getText equals: 'Before Cancel'.
	
	((driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :button | (button getAttribute: 'value') = 'After' ]) click.
	self assert: (driver findElementByTagName: 'pre') getText equals: 'Text: Some Text'.
	
	((driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :button | (button getAttribute: 'value') = 'After Submit' ]) click.
	self assert: (driver findElementByTagName: 'pre') getText equals: ('Text: Some Text', Character lf greaseString,'After Submit').
	
	((driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :button | (button getAttribute: 'value') = 'After Cancel' ]) click.
	self assert: (driver findElementByTagName: 'pre') getText equals: 'After Cancel'.
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testCallbackSecurityFunctionalTest [
	self selectTest: 'WACallbackSecurityFunctionalTest'.
	
	self deny: ((driver findElementsByTagName: 'p') anySatisfy: [ :p | p getText = 'This should always be a NUMBER: 3' ]).
	self deny: ((driver findElementsByTagName: 'p') anySatisfy: [ :p | p getText = 'This should always be a LETTER: C' ]).
	
	(driver findElementByPartialLinkText: 'Try to break it') click.
	
	self assert: ((driver findElementsByTagName: 'p') anySatisfy: [ :p | p getText = 'This should always be a NUMBER: 3' ]).
	self assert: ((driver findElementsByTagName: 'p') anySatisfy: [ :p | p getText = 'This should always be a LETTER: C' ]).
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testCanvasTableFunctionalTest [
  | entities entitiesTable rows currencyTable headers entityHeaders exchangeRates |
  self selectTest: 'WACanvasTableFunctionalTest'.
  entityHeaders := #(#('Character' 'Entity' 'Decimal' 'Hex' 'Rendering in Your Browser') #('Entity' 'Decimal' 'Hex')).
  entities := {#('non-breaking space' '&nbsp;' '&#160;' '&#xA0;' ' ' ' ' ' ').
  #('ampersand' '&amp;' '&#38;' '&#x26;' '&' '&' '&').
  #('less than sign' '&lt;' '&#60;' '&#x3C;' '<' '<' '<').
  #('greater than sign' '&gt;' '&#62;' '&#x3E;' '>' '>' '>').
  {'euro sign'.
  '&euro;'.
  '&#8364;'.
  '&#x20AC;'.
  (String with: (Character codePoint: 8364)).
  (String with: (Character codePoint: 8364)).
  (String with: (Character codePoint: 8364))}}.
  entitiesTable := (driver findElementsByTagName: 'table')
    detect: [ :table | (table findElementByTagName: 'caption') getText = 'HTML 4.0 entities' ].
  headers := entitiesTable findElementsByCSSSelector: 'thead tr'.
  headers
    with: entityHeaders
    do: [ :header :headerDef | 
      self
        assert: ((header findElementsByTagName: 'th') collect: #'getText')
        equals: headerDef ].
  rows := entitiesTable findElementsByCSSSelector: 'tbody tr'.
  rows
    with: entities
    do: [ :row :entityDef | 
      self
        assert: ((row findElementsByTagName: 'td') collect: #'getText')
        equals: entityDef ].
  exchangeRates := #(#('EUR' '1.70') #('USD' '1.30') #('DKK' '23.36') #('SEK' '19.32')).
  currencyTable := (driver findElementsByTagName: 'table')
    detect: [ :table | 
      (table findElementByTagName: 'caption') getText
        = 'Currencies against Swiss Franc (CHF)' ].
  rows := currencyTable findElementsByCSSSelector: 'tbody tr'.
  rows
    with: exchangeRates
    do: [ :row :entityDef | 
      self assert: (row findElementByTagName: 'th') getText equals: entityDef first.
      self
        assert: (row findElementByTagName: 'td') getText
        equals: entityDef second ]
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testCanvasTagFunctionalTest [
	|  |
	self selectTest: 'WACanvasTagTest'.
	"Can only test if this does not crash"
	driver findElementByID: #tutorial.
	self assert: ((driver findElementsByTagName: 'script') anySatisfy: [ :script | (script getProperty: 'innerHTML') = 'drawShape()' ]).
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testContextFunctionalTest [
	| possibleResponses requestHandlers responseText |
	self selectTest: 'WAContextFunctionalTest'.

	self assert: ((GRCodec allCodecs collect: #printString) includes: ((driver findElementByID: 'Codec:') findElementByXPath: './td') getText).
	self assert: (((driver findElementByID: 'Session:') findElementByXPath: './td') getText copyWithout: Character space) equals: 'aWASession'.
	self assert: (((driver findElementByID: 'Application:') findElementByXPath: './td') getText copyWithout: Character space) equals: 'aWAApplication'.
	self assert: ((((driver findElementByID: 'Request:') findElementByXPath: './td') getText copyWithout: Character space) greaseBeginsWith: 'aWARequest').
	
	possibleResponses := WAResponse allSubclasses collect:[ :c | 'a ', c name ].
	responseText := ((driver findElementByID: 'Response:') findElementByXPath: './td') getText.
	self assert: (possibleResponses anySatisfy: [ :prefix | responseText greaseBeginsWith: prefix ]).
	
	requestHandlers := driver findElementByID: 'handlers'.
	self assert: ((requestHandlers findElementByXPath: './ol/li[1]') getText copyWithout: Character space) equals: 'aWARenderPhaseContinuation'.
	self assert: ((requestHandlers findElementByXPath: './ol/li[2]') getText copyWithout: Character space) equals: 'aWASession'.
	self assert: ((requestHandlers findElementByXPath: './ol/li[3]') getText copyWithout: Character space) equals: 'aWAApplication'.
	self assert: ((requestHandlers findElementByXPath: './ol/li[4]') getText copyWithout: Character space) equals: 'aWADispatcher'
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testCookieFunctionalTest [

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
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testDateSelectorFunctionalTest [

	| fromDate toDate fromDateSelects toDateSelects fromTime toTime fromTimeSelects toTimeSelects deltaTime fromDateAndTime deltaDuration toDateAndTime fromDateAndTimeSelects toDateAndTimeSelects |
	self selectTest: 'WADateSelectorFunctionalTest'.

  fromDate := Date year: (Date today year - 1) month: 5 day: 11.
  toDate := fromDate addDays: 300.
	
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
	
	fromTime := Time hour: 16 minute: 30 second: 10.
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

{ #category : 'testing' }
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

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testDelayFunctionalTest [
	self selectTest: 'WADelayFunctionalTest'.

	self should: [ (driver findElementByTagName: 'h3') ] raise: BPNoSuchElementException.
	(driver findElementByPartialLinkText: 'Start') click.
	self assert: (driver findElementByTagName: 'h3') getText = '3 seconds'.
	(Delay forSeconds: 3) wait.
	self should: [ (driver findElementByTagName: 'h3') ] raise: BPNoSuchElementException.
	self shouldnt: [ driver findElementByPartialLinkText: 'Start' ] raise: BPNoSuchElementException
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testDelegationFunctionalTest [
  | step1aVisiblePresenters step1bVisiblePresenters step2VisiblePresenters step1cVisiblePresenters |
  self selectTest: 'WADelegationFunctionalTest'.
  step1aVisiblePresenters := OrderedCollection new.
  step1bVisiblePresenters := OrderedCollection new.
  step2VisiblePresenters := OrderedCollection new.
  step1cVisiblePresenters := OrderedCollection new.	"1"
  self assert: (driver findElementByTagName: 'h3') getText equals: 'Step 1'.
  (driver findElementByCSSSelector: 'input[type=submit][value=Ok]') click.
  self assert: (driver findElementByTagName: 'h3') getText equals: 'Step 2'.
  self componentUnderTest
    visiblePresentersDo: [ :presenter | step1aVisiblePresenters add: presenter class name ].
  self
    assert:
      (step1aVisiblePresenters select: [ :p | p = #'WAAnswerHandler' ]) size
    equals: 1.	"2"
  driver goBack.
  self assert: (driver findElementByTagName: 'h3') getText equals: 'Step 1'.
  self componentUnderTest
    visiblePresentersDo: [ :presenter | step1bVisiblePresenters add: presenter class name ].
  self
    assert:
      (step1bVisiblePresenters select: [ :p | p = #'WAAnswerHandler' ]) size
    equals: 1.
  self assert: step1aVisiblePresenters equals: step1bVisiblePresenters.	"3"
  self assert: (driver findElementByTagName: 'h3') getText equals: 'Step 1'.
  (driver findElementByCSSSelector: 'input[type=submit][value=Ok]') click.
  self assert: (driver findElementByTagName: 'h3') getText equals: 'Step 2'.
  self componentUnderTest
    visiblePresentersDo: [ :presenter | step2VisiblePresenters add: presenter class name ].
  self assert: step1aVisiblePresenters equals: step2VisiblePresenters.	"4"
  (driver findElementByCSSSelector: 'input[type=submit][value=Ok]') click.
  self assert: (driver findElementByTagName: 'h3') getText equals: 'Step 1'.
  self componentUnderTest
    visiblePresentersDo: [ :presenter | step1cVisiblePresenters add: presenter class name ].
  self
    assert:
      (step1cVisiblePresenters select: [ :p | p = #'WAAnswerHandler' ]) size
    equals: 1.
  self assert: step1aVisiblePresenters equals: step1cVisiblePresenters
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testEncodingFunctionalTest [
	| germanSentence czechSentence japaneseSentence |
	germanSentence := 'Im finſteren Jagdſchloß am offenen Felsquellwaſſer patzte der affig-flatterhafte kauzig-höf‌liche Bäcker über ſeinem verſifften kniffligen C-Xylophon.'.
	czechSentence := 'Příliš žluťoučký kůň úpěl ďábelské kódy.'.
	japaneseSentence := 'いろはにほへど　ちりぬるを'.
	self selectTest: 'WAEncodingFunctionalTest'.
	(Array with: germanSentence with: czechSentence with: japaneseSentence)
		do: [ :sentence | 
			#(urlencoded multipart get)
				do: [ :idpart | 
					| formid headingid |
					formid := idpart , 'form'.
					headingid := idpart , 'heading'.
					((driver findElementByID: formid) findElementByCSSSelector: 'input[type=text]') sendKeys: sentence.
					((driver findElementByID: formid) findElementByCSSSelector: 'input[type=submit]') click.
					self assert: (driver findElementByID: headingid) getText equals: idpart , sentence ]
				separatedBy: [ ((driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :e | (e getAttribute: 'value') = 'Restart' ]) click ] ]
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testExceptionFunctionalTest [

	self selectTest: 'WAExceptionFunctionalTest'.

	(BPSelect on: (driver findElementByID: 'handlerselect')) selectByVisibleText: 'WAHtmlErrorHandler'.
	(driver findElementByID: #sethandler) click.

	(driver findElementByLinkText: 'Raise error') click.
	self assert: (driver findElementByTagName: 'h1') getText equals: 'WAError: Test Error'.
	self assert: (driver findElementByTagName: 'p') getText equals: 'Your request could not be completed. An exception occurred.'.
	driver goBack.
	
	((driver findElementsByCSSSelector: 'button[type=submit]') detect: [ :i | i getText = 'Raise error in POST' ]) click.
	self assert: (driver findElementByTagName: 'h1') getText equals: 'WAError: Test Error'.
	self assert: (driver findElementByTagName: 'p') getText equals: 'Your request could not be completed. An exception occurred.'.
	driver goBack.
	
	(driver findElementByLinkText: 'Raise error during rendering') click.
	self assert: ((driver findElementsByTagName: 'h1') anySatisfy: [ :e | e getText = 'WAError: Error during rendering.' ]).
	self assert: ((driver findElementsByTagName: 'p') anySatisfy: [ :e | e getText = 'Your request could not be completed. An exception occurred.' ]).
	driver goBack.
	
	(driver findElementByLinkText: 'Raise zero divide') click.
	self assert: ((driver findElementByTagName: 'h1') getText includesSubstring: 'ZeroDivide').
	self assert: (driver findElementByTagName: 'p') getText equals: 'Your request could not be completed. An exception occurred.'.
	driver goBack.
	
	self scrollWindowBy: 10@800 "need to scroll into view, especially when running headful".
	(driver findElementByLinkText: 'Raise warning') click.
	self assert: (driver findElementByTagName: 'h1') getText equals: 'Warning: Test Warning'.
	self assert: (driver findElementByTagName: 'p') getText equals: 'Your request could not be completed. An exception occurred.'.
	driver goBack.

	self scrollWindowBy: 10@800 "need to scroll into view, especially when running headful".
	(driver findElementByLinkText: 'Raise deprecated') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'To be displayed'.
	((driver findElementsByCSSSelector: 'input[type=submit]') detect: [ :i | (i getAttribute: 'value') = 'Ok' ]) click.
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testExpiryFunctionalTest [

	self selectTest: 'WAExpiryFunctionalTest'.
	"need to figure out how to make this work cross-platform... not impossible, just time and work"
	self fail.
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testFilterFunctionalTest [

	self selectTest: 'WAFilterFunctionalTest'.
	"need to figure out how to fill in the auth dialog and how to open a second browser?"	
	self fail.
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testFlowClosureFunctionalTest [

	| okButton |
	self selectTest: 'WAFlowClosureFunctionalTest'.
	
	okButton := [ (driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :e | (e getAttribute: 'value') = 'Ok' ] ].
	
	(driver findElementByPartialLinkText: 'Go') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: '1'.
	okButton value click.
	self assert: (driver findElementByTagName: 'h3') getText equals: '2'.
	driver goBack.
	self assert: (driver findElementByTagName: 'h3') getText equals: '1'.
	okButton value click.
	self assert: (driver findElementByTagName: 'h3') getText equals: '2'.
	okButton value click.
	self assert: (driver findElementByTagName: 'h3') getText equals: '3'.
	okButton value click.
	self shouldnt: [ (driver findElementByPartialLinkText: 'Go') ] raise: BPNotFoundException
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testFlowClosureFunctionalTest2 [

	| okButton |
	self selectTest: 'WAFlowClosureFunctionalTest'.
	"Some weird behavior goes on when returning to the start of the functional test. Error in Seaside or... ??"
	okButton := [ (driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :e | (e getAttribute: 'value') = 'Ok' ] ].
	
	(driver findElementByPartialLinkText: 'Go') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: '1'.
	okButton value click.
	self assert: (driver findElementByTagName: 'h3') getText equals: '2'.
	driver goBack.
	self assert: (driver findElementByTagName: 'h3') getText equals: '1'.
	driver goBack.
	(driver findElementByPartialLinkText: 'Go') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: '1'.
	okButton value click.
	self assert: (driver findElementByTagName: 'h3') getText equals: '2'.
	driver goBack.
	self assert: (driver findElementByTagName: 'h3') getText equals: '1'.
	driver goBack.	
	(driver findElementByPartialLinkText: 'Go') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: '1'.
	okButton value click.
	self assert: (driver findElementByTagName: 'h3') getText equals: '2'.
	okButton value click.
	self assert: (driver findElementByTagName: 'h3') getText equals: '3'.
	okButton value click.
	self shouldnt: [ (driver findElementByPartialLinkText: 'Go') ] raise: BPNotFoundException
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testFlowConvenienceFunctionalTest [

	| okButton selectOption yesButton cancelButton noButton |
	self selectTest: 'WAFlowConvenienceFunctionalTest'.

	okButton := [ (driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :e | (e getAttribute: 'value') = 'Ok' ] ].
	yesButton := [ (driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :e | (e getAttribute: 'value') = 'Yes' ] ].
	noButton := [ (driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :e | (e getAttribute: 'value') = 'No' ] ].
	cancelButton := [ (driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :e | (e getAttribute: 'value') = 'Cancel' ] ].
	selectOption := [ :option | (BPSelect on: (driver findElementsByTagName: 'select') second) selectByVisibleText: option ].
	
	selectOption value: 'Greyerzer'.
	okButton value click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Is Greyerzer your favorite cheese?'.
	yesButton value click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Your favorite cheese is Greyerzer.'.
	okButton value click.
	
	selectOption value: 'Tilsiter'.
	okButton value click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Is Tilsiter your favorite cheese?'.
	driver goBack.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'What''s your favorite Cheese?'.
	selectOption value: 'Tilsiter'.
	cancelButton value click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'What''s your favorite Cheese?'.
	selectOption value: 'Tilsiter'.
	okButton value click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Is Tilsiter your favorite cheese?'.
	yesButton value click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Your favorite cheese is Tilsiter.'.
	driver goBack.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Is Tilsiter your favorite cheese?'.
	noButton value click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'What''s your favorite Cheese?'.
	
	selectOption value: 'Sbrinz'.
	okButton value click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Is Sbrinz your favorite cheese?'.
	yesButton value click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Your favorite cheese is Sbrinz.'.
	okButton value click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'What''s your favorite Cheese?'
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testFlowDelegationFunctionalTest [
  | step1aVisiblePresenters step1bVisiblePresenters step2VisiblePresenters step1cVisiblePresenters |
  self selectTest: 'WAFlowDelegationFunctionalTest'.
  step1aVisiblePresenters := OrderedCollection new.
  step1bVisiblePresenters := OrderedCollection new.
  step2VisiblePresenters := OrderedCollection new.
  step1cVisiblePresenters := OrderedCollection new.	"1"
  self assert: (driver findElementByTagName: 'h3') getText equals: 'Step 1'.
  (driver findElementByCSSSelector: 'input[type=submit][value=Ok]') click.
  self assert: (driver findElementByTagName: 'h3') getText equals: 'Step 2'.
  self componentUnderTest
    visiblePresentersDo: [ :presenter | step1aVisiblePresenters add: presenter class name ].
  self
    assert:
      (step1aVisiblePresenters select: [ :p | p = #'WAAnswerHandler' ]) size
    equals: 1.	"2"
  driver goBack.
  self assert: (driver findElementByTagName: 'h3') getText equals: 'Step 1'.
  self componentUnderTest
    visiblePresentersDo: [ :presenter | step1bVisiblePresenters add: presenter class name ].
  self
    assert:
      (step1bVisiblePresenters select: [ :p | p = #'WAAnswerHandler' ]) size
    equals: 1.
  self assert: step1aVisiblePresenters equals: step1bVisiblePresenters.	"3"
  self assert: (driver findElementByTagName: 'h3') getText equals: 'Step 1'.
  (driver findElementByCSSSelector: 'input[type=submit][value=Ok]') click.
  self assert: (driver findElementByTagName: 'h3') getText equals: 'Step 2'.
  self componentUnderTest
    visiblePresentersDo: [ :presenter | step2VisiblePresenters add: presenter class name ].
  self assert: step1aVisiblePresenters equals: step2VisiblePresenters.	"4"
  (driver findElementByCSSSelector: 'input[type=submit][value=Ok]') click.
  self assert: (driver findElementByTagName: 'h3') getText equals: 'Step 1'.
  self componentUnderTest
    visiblePresentersDo: [ :presenter | step1cVisiblePresenters add: presenter class name ].
  self
    assert:
      (step1cVisiblePresenters select: [ :p | p = #'WAAnswerHandler' ]) size
    equals: 1.
  self assert: step1aVisiblePresenters equals: step1cVisiblePresenters
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testFlowErrorFunctionalTest [

	self selectTest: 'WAFlowErrorFunctionalTest'.

	(BPSelect on: (driver findElementByID: 'handlerselect')) selectByVisibleText: 'WAHtmlErrorHandler'.
	(driver findElementByID: #sethandler) click.
	(driver findElementByLinkText: 'Raise error') click.
	self assert: (driver findElementByTagName: 'h1') getText = 'WAError: Test Error'.
	self assert: (driver findElementByTagName: 'p') getText = 'Your request could not be completed. An exception occurred.'.
	driver goBack.
	
	(driver findElementByLinkText: 'Raise error in called component') click.
	self assert: (driver findElementByTagName: 'h3') getText = 'Once you close this, an error will be raised.'.
	((driver findElementsByCSSSelector: 'input[type=submit]') detect: [ :i | (i getAttribute: 'value') = 'Ok' ]) click.
	
	self assert: (driver findElementByTagName: 'h1') getText = 'WAError: Test Error'.
	self assert: (driver findElementByTagName: 'p') getText = 'Your request could not be completed. An exception occurred.'.
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testFlowFunctionalTest [
  | stackdepth |
  self selectTest: 'WAFlowFunctionalTest'.
  (driver findElementByPartialLinkText: 'go anchors') click.
  stackdepth := (driver findElementByPartialLinkText: '1:') getText
    copyAfterLast: $:.
  1 to: 5 do: [ :i | 
    self
      assert:
        ((driver findElementByPartialLinkText: i greaseString , ':') getText
          copyAfterLast: $:)
      equals: stackdepth.
    (driver findElementByPartialLinkText: i greaseString , ':') click ].
  (driver findElementByPartialLinkText: 'go buttons') click.
  stackdepth := (driver findElementByTagName: 'h3') getText copyAfterLast: $:.
  1 to: 5 do: [ :i | 
    self
      assert: (driver findElementByTagName: 'h3') getText
      equals: i asString , ':' , stackdepth greaseString.
    (GRPlatform current class == (Smalltalk at: #GRGemStonePlatform ifAbsent:[ nil ]) and: [ i > 1 ])
      ifTrue: [ stackdepth := ' ' , (stackdepth asInteger + 1) greaseString ].
    ((driver findElementsByCSSSelector: 'input[type=submit]')
      detect: [ :e | (e getAttribute: 'value') = 'Ok' ]) click ]
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testFlowRenderingCallFunctionalTest [

	self selectTest: 'WAFlowRenderingCallFunctionalTest'.

	(driver findElementByPartialLinkText: 'This link') click.
	self assert: ((driver findElementByTagName: 'body') getText includesSubstring: 'You can only #call: and #answer: from within a callback or a Task')
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testHomeFunctionalTest [

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
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testHtml5ContentTest [

	self selectTest: 'WAHtml5ContentTest'.
	
	"We merely verify if no rendering error produced, so just checking the final paragraph is on the page."
	
	self assert: ('*Copyright 2007 Elliotte Rusty Harold*' match: (driver findElementByTagName: 'body') getText).
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testHtml5ElementsTest [

	self selectTest: 'WAHtml5ElementsTest'.
	
	"We merely verify if no rendering error produced, so just checking some piece is on the page"
	
	self assert: ('*<track>*' match: (driver findElementByTagName: 'body') getText).
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testHtml5InputTest [

	self selectTest: 'WAHtml5InputTest'.
	
	"We merely verify if no rendering error produced, so just checking some piece is on the page"
	
	self assert: ('*datalist*' match: (driver findElementByTagName: 'body') getText).
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testParameterFunctionalTest [

	self selectTest: 'WAParameterFunctionalTest'.
	
	((driver findElementsByCSSSelector: 'input[type="submit"]') detect: [ :e | (e getAttribute:'value') = 'run test' ]) click.
	self assert: (driver findElementByTagName: 'strong') getText equals: 'success'
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testParentFunctionalTest [

	self selectTest: 'WAParentFunctionalTest'.
	
	(driver findElementByPartialLinkText: 'swap parent') click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Test passes!'
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testTableReportFunctionalTest [
	| firstColumn classNames |
	self selectTest: 'WATableReportFunctionalTest'.
	
	firstColumn := driver findElementsByCSSSelector: 'table>tbody>tr>td:first-child'.
	classNames := (firstColumn collect: [ :e | e getText ]).
	self assert: ((WAComponent allSubclasses collect: [ :c | c name greaseString ]) allSatisfy: [ :className | classNames includes: className ]).
	
	((driver findElementByCSSSelector: 'table>thead') findElementByPartialLinkText: 'Name') click.
	
	firstColumn := driver findElementsByCSSSelector: 'table>tbody>tr>td:first-child'.
	self assert:
			(firstColumn collect: [ :e | e getText ]) asOrderedCollection 
				equals: (WAComponent allSubclasses collect: [ :c | c name greaseString ]) sorted asOrderedCollection.
				
	((driver findElementByCSSSelector: 'table>thead') findElementByPartialLinkText: 'Name') click.
	firstColumn := driver findElementsByCSSSelector: 'table>tbody>tr>td:first-child'.
	self assert:
			(firstColumn collect: [ :e | e getText ]) asOrderedCollection 
				equals: (WAComponent allSubclasses collect: [ :c | c name greaseString ]) sorted asOrderedCollection reversed .
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testTaskErrorFunctionalTest [

	| resultText |
	self selectTest: 'WATaskErrorFunctionalTest'.
	
	resultText := (driver findElementByTagName: 'h3') getText.
	self assert: resultText equals: 'Raise an exception?'.
			
	((driver findElementByClassName: 'dialog-button-yes') findElementByTagName: 'input') click.
	resultText := (driver findElementByTagName: 'h3') getText.
	self assert: ('Caught:*foo' match: resultText).
	
	((driver findElementByClassName: 'dialog-button-ok') findElementByTagName: 'input') click.
	resultText := (driver findElementByTagName: 'h3') getText.
	self assert: resultText equals: 'Raise an exception?'.
	
	((driver findElementByClassName: 'dialog-button-no') findElementByTagName: 'input') click.
	resultText := (driver findElementByTagName: 'h3') getText.
	self assert: resultText equals: 'Raise an exception?'.
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testTrailFunctionalTest [
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
	self assert: ((driver findElementByClassName: 'trail') getText copyAfterLast: $>) trimBoth equals: currentItem getText.
	
	(driver findElementByPartialLinkText: 'Answer') click.
	currentItem := ((driver findElementsByTagName: 'h1') select: [ :e | e getText beginsWith: 'Item' ]) first.
	self assert: item3 equals: currentItem getText.
	
	(driver findElementByPartialLinkText: 'Item 1') click.
	self assert: ((driver findElementByClassName: 'trail') findElementsByClassName: 'separator') size equals: 0.
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testTrailingSlashFunctionalTest [
	
	self selectTest: 'WATrailingSlashFunctionalTest'.
	
	#('With Slash' 'Without Slash') do: [ :label |
		self assert: ((driver findElementByPartialLinkText: label) findElementByXPath: '../preceding-sibling::td') getText equals: 'not run'.
		(driver findElementByPartialLinkText: label) click.
		self assert: ((driver findElementByPartialLinkText: label) findElementByXPath: '../preceding-sibling::td') getText equals: 'success'
	]
	
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testTreeFunctionalTest [
	
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
	(GRPlatform current class == (Smalltalk at: #GRGemStonePlatform ifAbsent:[ nil ]))
		ifTrue:[ 
			((driver findElementByPartialLinkText: 'Interval') findElementByXPath: '../../span[contains(@class, ''button'')]') click.
			self assert: ((driver findElementsByClassName: 'label') anySatisfy: [ :e | e getText = 'Range' ]).
			self should: [ (driver findElementByPartialLinkText: 'Range') ] raise: BPNoSuchElementException ]
		ifFalse:[ self should: [ (driver findElementByPartialLinkText: 'Interval') ] raise: BPNoSuchElementException ].
			
	((driver findElementByPartialLinkText: 'SequenceableCollection') findElementByXPath: '../../span[contains(@class, ''button'')]') click.
	self assert: ((driver findElementsByClassName: 'label') noneSatisfy: [ :e | e getText = 'Interval' ])
	
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testUploadFunctionalTest [

	| filePathString |
	self selectTest: 'WAUploadFunctionalTest'.

	[ 
		filePathString := GRPlatform current newTemporaryFileNamed: 'testfile.txt'.
		GRPlatform current
			writeFileStreamOn: filePathString
			do: [ :stream | stream nextPutAll: 'blabla' ]
			binary: false.

		(driver findElementByCSSSelector: 'input[type=file]') sendKeys: filePathString.
		(driver findElementByCSSSelector: 'input[value=Load]') click.

		self assert: (driver findElementByCSSSelector: 'pre') getText equals: 'blabla'
	] ensure: [ GRPlatform current deleteFile: filePathString ]
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testUploadFunctionalTestWithStreamingUploads [

	| originalStreamUploadsSetting |
	originalStreamUploadsSetting := self zincServer streamUploads.
	[ 
		self zincServer streamUploads: true.
		self testUploadFunctionalTest
	] ensure: [ self zincServer streamUploads: originalStreamUploadsSetting. ]
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testUrlDecodingFunctionalTest [
	
	self selectTest: 'WAUrlDecodingFunctionalTest'.
	
	self assert: ((driver findElementsByTagName: 'h3') select:[ :e | e getText = 'Success!' ]) isEmpty.
	(driver findElementByPartialLinkText: 'Run Test') click.
	self assert: ((driver findElementsByTagName: 'h3') select:[ :e | e getText = 'Success!' ]) size equals: 1.

]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testUrlEncodingFunctionalTest [
	| checkAction |
	self selectTest: 'WAUrlEncodingFunctionalTest'.
	
	checkAction := [ :text | 
		(driver findElementByID: 'input') clear; sendKeys: text.
		((driver findElementByID: 'input') findElementByXPath: '../input[@type="submit"]') click.
		self assert: (driver findElementByID: 'inputresult') getText equals: text.
		self assert: (driver findElementByID: 'parameterresult') getText equals: text.
		self assert: (driver findElementByID: 'pathresult') getText equals: text ].

	checkAction value: 'kācaṃ śaknomyattum; nopahinasti mām'.
	checkAction value: 'Mohu jíst sklo, neublíží mi'.
	checkAction value: 'Les naïfs ægithales hâtifs pondant à Noël où il gèle sont sûrs d''être déçus en voyant leurs drôles d''œufs abîmés'.
	checkAction value: 'Im finſteren Jagdſchloß am offenen Felsquellwaſſer patzte der affig-flatterhafte kauzig-höf‌liche Bäcker über ſeinem verſifften kniffligen C-Xylophon'.
]

{ #category : 'testing' }
WAWebDriverFunctionalTestCase >> testValidationDecorationFunctionalTest [

	self selectTest: 'WAValidationDecorationFunctionalTest'.
	
	(driver findElementsByPartialLinkText: 'Start') first click.
	self deny: ((driver findElementByTagName: 'body') getText includes: 'Validation Failed!').

	(driver findElementsByPartialLinkText: 'Fail validation') first click.
	self assert: (driver findElementByClassName: 'validation-error') getText equals: 'Validation Failed!'.
	
	(driver findElementsByPartialLinkText: 'Succeed validation') first click.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Validation Succeeded!'.
	
	((driver findElementsByTagName: 'input') detect:[ :e | (e getAttribute:'value') = 'Ok' ]) click.
	self assert: (driver findElementsByPartialLinkText: 'Start') notEmpty
]

{ #category : 'private' }
WAWebDriverFunctionalTestCase >> zincServer [

	^ (Smalltalk at: #GemServer ifAbsent: [ nil ])
		  ifNil: [ WAAdmin serverAdaptors first server ]
		  ifNotNil: [ ((Smalltalk at: #GemServer) gemServerNamed: 'Seaside') serverInstance ]
]
