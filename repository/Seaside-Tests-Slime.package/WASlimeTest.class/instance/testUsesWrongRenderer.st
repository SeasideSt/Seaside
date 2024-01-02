tests-parsetree
testUsesWrongRenderer
	| class |
	class := self defineSubClassOf: #WAComponent.
	self
		compile: 'renderContentOn: html
			html updater callback: [ :r | html div ]'
		in: class.
	self 
		runRule: WAUsesWrongRendererRule
		selectors: #(renderContentOn:)