rendering
renderContentPaneOn: html
	html form class: 'definition'; with: [
	 	html div: [
			html textArea on: #contents of: self.
			html break.
			html submitButton on: #accept of: self ] ]