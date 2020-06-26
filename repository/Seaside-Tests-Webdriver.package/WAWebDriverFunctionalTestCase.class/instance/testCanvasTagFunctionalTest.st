testing
testCanvasTagFunctionalTest
	|  |
	self selectTest: 'WACanvasTagTest'.
	"Can only test if this does not crash"
	driver findElementByID: #tutorial.
	(driver findElementsByTagName: 'script') anySatisfy: [:script | script getText = 'drawShape()' ].