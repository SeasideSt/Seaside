tests-block
testCallSuperImplementation
	| class painter |
	class := self defineSubClassOf: #WAObject.
	self compile: 'postCopy self postCopy' in: class. 
	painter := self
		defineClass: #WASlimeMockComponent
		superclass: #WAPainter.
	self compile:  'updateRoot: aHtmlRoot self updateUrl: aHtmlRoot' in: painter.
	self
		runRule: WACallSuperImplementationRule
		selectors: #(postCopy updateRoot:)