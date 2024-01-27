tests-parsetree
testUnnecessaryBlockPassedToBrush

	| class |
	class := self defineSubClassOf: #WAComponent.
	self
		compile: 'renderContent01On: html html div: [ ]'
		in: class.
	self
		compile: 'renderContent02On: html html div: [ html text: 2 ]'
		in: class.
	self
		compile: 'renderContent03On: html html div: [ html render: 3 ]'
		in: class.
	self
		compile: 'renderContent04On: html html div class: #foo; with: [ ]'
		in: class.
	self
		compile: 'renderContent05On: html html div class: #foo; with: [ html text: 5 ]'
		in: class.
	self
		compile: 'renderContent06On: html html div class: #foo; with: [ html render: 6 ]'
		in: class.
	self
		assertRule: WAUnnecessaryBlockPassedToBrushRule
		matches: { class>>#renderContent01On: . class>>#renderContent02On: . class>>#renderContent03On: . class>>#renderContent04On: . class>>#renderContent05On: . class>>#renderContent06On: }