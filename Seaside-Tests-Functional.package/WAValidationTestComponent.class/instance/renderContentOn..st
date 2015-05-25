rendering
renderContentOn: html
	html anchor
		callback: [
			self answer: false ];
		with: 'Fail validation'.
	html break.
	html anchor
		callback: [
			self answer: true ];
		with: 'Suceed validation'