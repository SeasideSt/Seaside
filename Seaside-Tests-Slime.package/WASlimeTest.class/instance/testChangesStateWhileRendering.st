tests-block
testChangesStateWhileRendering
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	class addInstanceVariable: 'foo'.
	self compile: 'renderContentOn: html html div: [ foo := nil ]' in: class.
	self 
		runRule: WAChangesStateWhileRenderingRule
		selectors: #(renderContentOn:)