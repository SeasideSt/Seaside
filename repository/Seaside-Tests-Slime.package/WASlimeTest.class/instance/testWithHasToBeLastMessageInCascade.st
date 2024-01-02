tests-parsetree
testWithHasToBeLastMessageInCascade
	| class |
	class := self defineSubClassOf: #WAComponent.
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