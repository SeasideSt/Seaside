testing
testWAHtml5ElementsTest

	self selectTest: 'WAHtml5ElementsTest'.
	
	"We merely verify if no rendering error produced, so just checking some piece is on the page"
	
	self assert: ('*<track>*' match: (driver findElementByTagName: 'body') getText).