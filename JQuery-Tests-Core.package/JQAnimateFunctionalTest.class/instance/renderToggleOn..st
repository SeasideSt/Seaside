rendering
renderToggleOn: html
	html anchor
		onClick: ((html jQuery: #seastar) animate width: 'toggle');
		with: 'Toggle Width'.
	html anchor
		onClick: ((html jQuery: #seastar) animate height: 'toggle');
		with: 'Toggle Height'