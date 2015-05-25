tests-parsetree
testSequencedAsynchronousCalls
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	class
		compile: 'renderContent1On: html
			html div
				onClick: (html jQuery ajax callback: [  ]) , (html jQuery ajax serializeForm);
				with: ''Click me'''
		classified: #(rendering).
	class
		compile: 'renderContent2On: html
			html div
				onClick: (html jQuery ajax serializeForm; callback: [  ]) , (html jQuery effect bounce);
				with: ''Click me'''
		classified: #(rendering).
	self 
		runRule: WASequencedAsynchronousCallsRule
		selectors: #(renderContent1On: renderContent2On:)