rendering
renderContentOn: html
	(html tag: 'style') with:
	'h1, a { font-family: monospace }
	'.
	html render: counter