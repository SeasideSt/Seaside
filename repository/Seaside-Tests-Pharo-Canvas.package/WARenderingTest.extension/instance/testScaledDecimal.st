*seaside-tests-pharo-canvas
testScaledDecimal
	| html |
	html := WAHtmlCanvas builder
		fullDocument: false;
		render: [ :canvas | canvas render: 123.4s1 ].
	self assert: html = '123.4'