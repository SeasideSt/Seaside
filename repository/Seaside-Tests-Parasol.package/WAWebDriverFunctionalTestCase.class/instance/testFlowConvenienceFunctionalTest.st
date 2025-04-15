testing
testFlowConvenienceFunctionalTest

	| okButton selectOption yesButton cancelButton noButton |
	self selectTest: 'WAFlowConvenienceFunctionalTest'.

	okButton := [ (driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :e | (e getAttribute: 'value') = 'Ok' ] ].
	yesButton := [ (driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :e | (e getAttribute: 'value') = 'Yes' ] ].
	noButton := [ (driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :e | (e getAttribute: 'value') = 'No' ] ].
	cancelButton := [ (driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :e | (e getAttribute: 'value') = 'Cancel' ] ].
	selectOption := [ :option | (BPSelect on: (driver findElementsByTagName: 'select') second) selectByVisibleText: option ].
	
	selectOption value: 'Greyerzer'.
	okButton value click.
	self workaroundChromeDriver.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Is Greyerzer your favorite cheese?'.
	yesButton value click.
	self workaroundChromeDriver.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Your favorite cheese is Greyerzer.'.
	okButton value click.
	self workaroundChromeDriver.
	
	selectOption value: 'Tilsiter'.
	okButton value click.
	self workaroundChromeDriver.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Is Tilsiter your favorite cheese?'.
	driver goBack.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'What''s your favorite Cheese?'.
	selectOption value: 'Tilsiter'.
	cancelButton value click.
	self workaroundChromeDriver.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'What''s your favorite Cheese?'.
	selectOption value: 'Tilsiter'.
	okButton value click.
	self workaroundChromeDriver.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Is Tilsiter your favorite cheese?'.
	yesButton value click.
	self workaroundChromeDriver.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Your favorite cheese is Tilsiter.'.
	driver goBack.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Is Tilsiter your favorite cheese?'.
	noButton value click.
	self workaroundChromeDriver.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'What''s your favorite Cheese?'.
	
	selectOption value: 'Sbrinz'.
	okButton value click.
	self workaroundChromeDriver.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Is Sbrinz your favorite cheese?'.
	yesButton value click.
	self workaroundChromeDriver.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'Your favorite cheese is Sbrinz.'.
	okButton value click.
	self workaroundChromeDriver.
	self assert: (driver findElementByTagName: 'h3') getText equals: 'What''s your favorite Cheese?'