rendering
renderContentOn: html
	message contents isNil ifFalse: [
		html div
			class: 'validation-error';
			with: message contents ].
	self renderNextOn: html