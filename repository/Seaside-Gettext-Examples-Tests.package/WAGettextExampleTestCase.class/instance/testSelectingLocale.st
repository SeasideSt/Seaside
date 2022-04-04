running
testSelectingLocale

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