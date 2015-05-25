rendering
renderRelativeOn: html
	html anchor
		onClick: ((html jQuery: #seastar) animate left: '-=100px');
		with: 'Move Left'.
	html anchor
		onClick: ((html jQuery: #seastar) animate left: '+=100px');
		with: 'Move Right'