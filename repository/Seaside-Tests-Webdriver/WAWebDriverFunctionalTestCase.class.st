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
