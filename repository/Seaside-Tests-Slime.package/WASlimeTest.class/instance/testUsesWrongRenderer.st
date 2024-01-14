tests-parsetree
testUsesWrongRenderer

	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	self
		compile: 'renderContentOn: html
			html updater callback: [ :r | html div ]'
		in: class.
	self 
		assertRule: WAUsesWrongRendererRule
		matches: { class>>#renderContentOn: }