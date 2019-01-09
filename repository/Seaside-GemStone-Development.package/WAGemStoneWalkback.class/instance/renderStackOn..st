rendering
renderStackOn: html
	html heading level: 3; with: 'Stack Trace'.
	html orderedList: [
		self frames do: [ :each |
			html listItem: [
				self renderStackFrame: each on: html ] ] ]