Class {
	#name : 'WAGettextExampleTestCase',
	#superclass : 'BPSeasideWebDriverTestCase',
	#instVars : [
		'title'
	],
	#category : 'Seaside-Tests-Gettext-Examples',
	#package : 'Seaside-Tests-Gettext-Examples'
}

{ #category : 'running' }
WAGettextExampleTestCase >> baseURL [
	^ 'http://localhost:' , (BPSmalltalkPlatform current port printString) , '/examples/gettext'
]

{ #category : 'running' }
WAGettextExampleTestCase >> componentClass [

	^ WAGettextExample.
]

{ #category : 'running' }
WAGettextExampleTestCase >> desiredDriverBrowserCapabilities [

	| capabilities |

	capabilities := BPChromeOptions new.

	(self isInTestDebuggingMode) ifFalse: [
		capabilities setHeadless: true.
		capabilities addArguments: (#('no-sandbox' 'window-size=1920,1080') flag: 'Passing a window size here has no effect, as the window size is set in #setUp?') ].
		
	^ capabilities
]

{ #category : 'running' }
WAGettextExampleTestCase >> testSelectingLocale [

	| localeLink h1Element |
	localeLink := driver findElementByLinkText: 'locale de-CH'.
	localeLink click.
	h1Element := driver findElementByTagName: 'h1'.
	self assert: h1Element getText equals: 'schriftgröße'.
	
	localeLink := driver findElementByLinkText: 'locale fr'.
	localeLink click.
	h1Element := driver findElementByTagName: 'h1'.
	self assert: h1Element getText equals: 'taille de police'.
	
	localeLink := driver findElementByLinkText: 'locale nl-BE'.
	localeLink click.
	h1Element := driver findElementByTagName: 'h1'.
	self assert: h1Element getText equals: 'schriftgrootte'.

	"click the same link twice"
	localeLink := driver findElementByLinkText: 'locale en'.
	localeLink click.
	h1Element := driver findElementByTagName: 'h1'.
	self assert: h1Element getText equals: 'fontsize'.
	localeLink := driver findElementByLinkText: 'locale en'.
	localeLink click.
	h1Element := driver findElementByTagName: 'h1'.
	self assert: h1Element getText equals: 'fontsize'.
]
