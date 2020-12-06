testing
testHtml5InputTest

	self selectTest: 'WAHtml5InputTest'.
	
	"We merely verify if no rendering error produced, so just checking some piece is on the page"
	
	self assert: ('*datalist*' match: (driver findElementByTagName: 'body') getText).