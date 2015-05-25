rendering
renderContentOn: html
	html script: self drawFunction.
	html canvas id: 'tutorial'; width: 150; height: 150.
	html script: 'drawShape()'
