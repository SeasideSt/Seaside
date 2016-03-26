rendering
renderToggleUIProcessOn: html
	html anchor
		callback: [ self toggleUIProcess ];
		with: self toggleUIText