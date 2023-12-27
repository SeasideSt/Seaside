tests-parsetree
testSequencedAsynchronousCalls
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	self
		compile: 'renderContent1On: html
			html div
				onClick: (html jQuery ajax callback: [  ]) , (html jQuery ajax serializeForm);
				with: ''Click me'''
		in: class.
	self
		compile: 'renderContent2On: html
			html div
				onClick: (html jQuery ajax serializeForm; callback: [  ]) , (html jQuery effect bounce);
				with: ''Click me'''
		in: class.
	self 
		runRule: WASequencedAsynchronousCallsRule
		selectors: #(renderContent1On: renderContent2On:)