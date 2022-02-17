testing
testCanvasTagFunctionalTest
	|  |
	self selectTest: 'WACanvasTagTest'.
	"Can only test if this does not crash"
	driver findElementByID: #tutorial.
	self assert: ((driver findElementsByTagName: 'script') anySatisfy: [ :script | (script getProperty: 'innerHTML') = 'drawShape()' ]).