tests-parsetree
testSendsRenderContentOn
	| class |
	class := self defineSubClassOf: #WAComponent.
	self
		compile: 'invalid self renderContentOn: nil'
		in: class.
	self 
		runRule: WASendsRenderContentOnRule
		selectors: #(invalid)