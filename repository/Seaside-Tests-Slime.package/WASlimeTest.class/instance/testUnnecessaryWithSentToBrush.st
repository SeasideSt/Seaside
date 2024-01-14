tests-parsetree
testUnnecessaryWithSentToBrush

	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	self
		compile: 'renderContentOn: html html div with: 123'
		in: class.
	self
		assertRule: WAUnnecessaryWithSentToBrushRule
		matches: { class>>#renderContentOn: }