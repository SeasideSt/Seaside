rendering
renderContentOn: html
	html div
		class: 'groupContent';
		with: [
			self renderHeadingsOn: html.
			self renderFilesOn: html.
			self renderWriteToDiskOn: html.
			html space.
			self renderDoneOn: html ]