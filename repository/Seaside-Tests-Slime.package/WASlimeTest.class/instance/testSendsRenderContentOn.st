tests-parsetree
testSendsRenderContentOn
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	class
		compile: 'invalid self renderContentOn: nil'
		classified: #(rendering).
	self 
		runRule: WASendsRenderContentOnRule
		selectors: #(invalid)