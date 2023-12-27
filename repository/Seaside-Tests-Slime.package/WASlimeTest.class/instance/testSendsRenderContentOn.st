tests-parsetree
testSendsRenderContentOn
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	self
		compile: 'invalid self renderContentOn: nil'
		in: class.
	self 
		runRule: WASendsRenderContentOnRule
		selectors: #(invalid)