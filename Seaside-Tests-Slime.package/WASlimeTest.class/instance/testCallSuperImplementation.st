tests-block
testCallSuperImplementation
	| object painter |
	object := self
		defineClass: #WASlimeMockObject
		superclass: #WAObject.
	self compile: 'postCopy self postCopy' in: object. 
	painter := self
		defineClass: #WASlimeMockComponent
		superclass: #WAPainter.
	self compile:  'updateRoot: aHtmlRoot self updateUrl: aHtmlRoot' in: painter.
	self
		runRule: WACallSuperImplementationRule
		selectors: #(postCopy updateRoot:)