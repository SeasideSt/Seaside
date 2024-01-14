tests-block
testChangesStateWhileRendering

	| class |
	class := self defineSubClassOf: #WAComponent.
	class addInstVarNamed: 'foo'.
	self compile: 'renderContentOn: html html div: [ foo := nil ]' in: class.
	self 
		assertRule: WAChangesStateWhileRenderingRule
		matches: { class>>#renderContentOn: }