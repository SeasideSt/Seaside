testing
testWATrailingSlashFunctionalTest
	
	self selectTest: 'WATrailingSlashFunctionalTest'.
	
	#('With Slash' 'Without Slash') do: [ :label |
		self assert: ((driver findElementByPartialLinkText: label) findElementByXPath: '../preceding-sibling::td') getText equals: 'not run'.
		(driver findElementByPartialLinkText: label) click.
		self assert: ((driver findElementByPartialLinkText: label) findElementByXPath: '../preceding-sibling::td') getText equals: 'success'
	]
	