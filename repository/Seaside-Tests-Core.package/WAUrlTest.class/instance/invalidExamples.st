testing-parsing
invalidExamples
	"These examples are not legal. The test assures that an error is thrown."
	
	^ #(
		
		 "port"
		  'http://www.seaside.st:8x/'
		  'http://www.seaside.st:x8/' )