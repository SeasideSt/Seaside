testing
testButtonFunctionalTest
	| inputValue textValue |
	self selectTest: 'WAButtonFunctionalTest'.

	"Push submit"	
	(driver findElementByCSSSelector: 'input[type=text]') click.
	driver getKeyboard sendKeys: 'At the Seaside!'.
	self assert: (driver findElementByTagName: 'td') getText equals: 'a text'.	
	(driver findElementByCSSSelector: 'button[type=submit]') click.
	self assert: (driver findElementByTagName: 'td') getText equals: 'a textAt the Seaside!'.

	"Push reset"
	self assert: ((driver findElementByCSSSelector: 'input[type=text]') getAttribute:'value') equals: 'a textAt the Seaside!'.
	(driver findElementByCSSSelector: 'input[type=text]') click.
	driver getKeyboard sendKeys: 'blabla'.
	self deny: ((driver findElementByCSSSelector: 'input[type=text]') getAttribute:'value') equals: 'a textAt the Seaside!'.
	(driver findElementByCSSSelector: 'button[type=reset]') click.
	self assert: ((driver findElementByCSSSelector: 'input[type=text]') getAttribute:'value') equals: 'a textAt the Seaside!'.
	
	"Push push"
	(driver findElementByCSSSelector: 'input[type=text]') click.
	driver getKeyboard sendKeys: 'blabla'.
	inputValue := (driver findElementByCSSSelector: 'input[type=text]') getAttribute:'value'.
	textValue := (driver findElementByTagName: 'td') getText.
	self deny: inputValue equals: textValue.
	(driver findElementByCSSSelector: 'button[type=button]') click.
	self assert: ((driver findElementByCSSSelector: 'input[type=text]') getAttribute:'value') equals: inputValue.
	self assert: (driver findElementByTagName: 'td') getText equals: textValue