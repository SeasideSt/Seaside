rendering
renderContentOn: html
	html div id: 'flamegraph'.
	
	html script: (WAFlameGraphScript on: messageTally)