tests-block
testDoNotUseWhileRendering

	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	self compile: 'renderContentOn: html html div: [ self call: nil ]' in: class.
	self 
		assertRule: WADoNotUseWhileRenderingRule
		matches: { class>>#renderContentOn: }