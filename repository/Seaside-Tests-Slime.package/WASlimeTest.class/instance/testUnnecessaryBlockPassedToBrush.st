tests-parsetree
testUnnecessaryBlockPassedToBrush
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	class
		compile: 'renderContent01On: html html div: [ ]'
		classified: #(rendering).
	class
		compile: 'renderContent02On: html html div: [ html text: 2 ]'
		classified: #(rendering).
	class
		compile: 'renderContent03On: html html div: [ html render: 3 ]'
		classified: #(rendering).
	class
		compile: 'renderContent04On: html html div class: #foo; with: [ ]'
		classified: #(rendering).
	class
		compile: 'renderContent05On: html html div class: #foo; with: [ html text: 5 ]'
		classified: #(rendering).
	class
		compile: 'renderContent06On: html html div class: #foo; with: [ html render: 6 ]'
		classified: #(rendering).
	self
		runRule: WAUnnecessaryBlockPassedToBrushRule
		selectors: #(renderContent01On: renderContent02On: renderContent03On: renderContent04On: renderContent05On: renderContent06On:)