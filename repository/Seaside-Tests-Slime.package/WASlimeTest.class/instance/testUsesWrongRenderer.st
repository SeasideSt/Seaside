tests-parsetree
testUsesWrongRenderer
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	class
		compile: 'renderContentOn: html
			html updater callback: [ :r | html div ]'
		classified: #(rendering).
	self 
		runRule: WAUsesWrongRendererRule
		selectors: #(renderContentOn:)