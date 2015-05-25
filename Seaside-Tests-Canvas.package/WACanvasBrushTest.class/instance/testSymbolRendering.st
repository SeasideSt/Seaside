tests-encoding
testSymbolRendering
	self
		assert: [ :html | html div id: #aSymbol; with: #aSecondSymbol ]
		gives: '<div id="aSymbol">aSecondSymbol</div>'.
	self
		assert: [ :html | html div: [ html text: #aSecondSymbol ] ]
		gives: '<div>aSecondSymbol</div>'.
	self
		assert: [ :html | html div: [ html render: #aSecondSymbol ] ]
		gives: '<div>aSecondSymbol</div>'