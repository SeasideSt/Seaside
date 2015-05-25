tests-parsetree
testUnnecessaryWithSentToBrush
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	class
		compile: 'renderContentOn: html html div with: 123'
		classified: #(rendering).
	self
		runRule: WAUnnecessaryWithSentToBrushRule
		selectors: #(renderContentOn:)