rendering
javascriptOn: js
	(js function: 'd3.select') with: [ 
		js string: '#flamegraph' ].
	(js function: '.datum') with: [ 
		self renderTally: messageTally on: js ].
	(js function: '.call') with: [ 
		js argument: [ 
			 (js function: 'flamegraph') with: [  ] ] ]
	