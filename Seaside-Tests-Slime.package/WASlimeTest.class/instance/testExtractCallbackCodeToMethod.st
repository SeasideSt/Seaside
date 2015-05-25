tests-parsetree
testExtractCallbackCodeToMethod
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	class
		compile: 'renderInvalidOn: html
			html anchor 
				callback: [ self foo. self bar ];
				with: 1'
		classified: #(rendering).
	class
		compile: 'renderValidOn: html
			html anchor 
				callback: [ self foo ];
				with: 1'
		classified: #(rendering).
	self 
		runRule: WAExtractCallbackCodeToMethodRule
		selectors: #(renderInvalidOn:)