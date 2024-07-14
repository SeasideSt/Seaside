tests-parsetree
testUsesWrongRenderer

	| class |
	class := self defineSubClassOf: #WAComponent.
	self
		compile: 'renderContentOn: html
			html updater callback: [ :r | html div ]'
		in: class.
	self 
		assertRule: WAUsesWrongRendererRule
		matches: { class>>#renderContentOn: }.
		
	self
		compile: 'renderContentOn: html
			html jQuery load html: [ :r | html div ]'
		in: class.
	self 
		assertRule: WAUsesWrongRendererRule
		matches: { class>>#renderContentOn: }.
