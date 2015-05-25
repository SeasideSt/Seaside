rendering
renderContentOn: html
	html div
		class: 'groupContent';
		with: [
			self renderHeadingsOn: html.
			self renderAddFileOn: html.
			html break.
			self renderFilesOn: html.
			html paragraph: [
				self renderWriteToDiskOn: html.
				html space.
				self renderDoneOn: html ].
			
			self renderAPInfoOn: html ]