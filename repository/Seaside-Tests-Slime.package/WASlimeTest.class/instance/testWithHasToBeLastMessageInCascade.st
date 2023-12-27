tests-parsetree
testWithHasToBeLastMessageInCascade
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	self
		compile: 'renderContent01On: html
			html div
				with: ''foo'';
				class: ''bar'''
		in: class.
	self
		compile: 'renderContent02On: html
			html div
				id: ''zork'';
				with: ''foo'';
				class: ''bar'''
		in: class.
	self 
		runRule: WAWithHasToBeLastMessageInCascadeRule
		selectors: #(renderContent01On: renderContent02On:)