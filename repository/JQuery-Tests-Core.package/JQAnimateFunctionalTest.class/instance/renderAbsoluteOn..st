rendering
renderAbsoluteOn: html
	html anchor
		onClick: ((html jQuery: #seastar) animate opacity: 0.0);
		with: 'Opacity 0%'.
	html anchor
		onClick: ((html jQuery: #seastar) animate opacity: 0.5);
		with: 'Opacity 50%'.
	html anchor
		onClick: ((html jQuery: #seastar) animate opacity: 1.0);
		with: 'Opacity 100%'