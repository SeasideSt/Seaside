testing
testButtonFunctionalTest
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