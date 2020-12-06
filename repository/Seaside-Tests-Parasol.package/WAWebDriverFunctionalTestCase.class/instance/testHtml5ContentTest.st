testing
testHtml5ContentTest

	self selectTest: 'WAHtml5ContentTest'.
	
	"We merely verify if no rendering error produced, so just checking the final paragraph is on the page."
	
	self assert: ('*Copyright 2007 Elliotte Rusty Harold*' match: (driver findElementByTagName: 'body') getText).