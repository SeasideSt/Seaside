tests-parsetree
testWithHasToBeLastMessageInCascade
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	class
		compile: 'renderContent01On: html
			html div
				with: ''foo'';
				class: ''bar'''
		classified: #(rendering).
	class
		compile: 'renderContent02On: html
			html div
				id: ''zork'';
				with: ''foo'';
				class: ''bar'''
		classified: #(rendering).
	self 
		runRule: WAWithHasToBeLastMessageInCascadeRule
		selectors: #(renderContent01On: renderContent02On:)