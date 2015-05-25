tests-block
testDoNotUseWithinCallback
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	self compile: 'renderContentOn: html
		html anchor
			callback: [ html document addLoadScript: nil ];
			with: 123' in: class.
	self 
		runRule: WADoNotUseWithinCallbackRule
		selectors: #(renderContentOn:)