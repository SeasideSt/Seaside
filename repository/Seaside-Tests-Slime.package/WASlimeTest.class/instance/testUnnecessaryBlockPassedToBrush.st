tests-parsetree
testUnnecessaryBlockPassedToBrush
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
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
		runRule: WAUnnecessaryBlockPassedToBrushRule
		selectors: #(renderContent01On: renderContent02On: renderContent03On: renderContent04On: renderContent05On: renderContent06On:)