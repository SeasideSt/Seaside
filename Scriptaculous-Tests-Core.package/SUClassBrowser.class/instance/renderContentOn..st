rendering
renderContentOn: html
	html form id: 'browser'; with: [
		html heading: class fullName.
		html div
			class: 'selectors';
			with: [ self renderSelectorsOn: html ].
		html div
			id: 'source';
			with: [ self renderSourceOn: html ].
		html div
			class: 'close';
			with: [ self renderCloseOn: html ] ]