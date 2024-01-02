tests-parsetree
testExtractCallbackCodeToMethod
	| class |
	class := self defineSubClassOf: #WAComponent.
	self
		compile: 'renderInvalidOn: html
			html anchor 
				callback: [ self foo. self bar ];
				with: 1'
		in: class.
	self
		compile: 'renderValidOn: html
			html anchor 
				callback: [ self foo ];
				with: 1'
		in: class.
	self 
		runRule: WAExtractCallbackCodeToMethodRule
		selectors: #(renderInvalidOn:)