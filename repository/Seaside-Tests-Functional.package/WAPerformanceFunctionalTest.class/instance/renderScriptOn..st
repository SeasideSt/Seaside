rendering
renderScriptOn: canvas
	self renderInline: [ :html | html script: 'self.close()' ] key: #script on: canvas