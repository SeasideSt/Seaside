rendering
renderDownloadOn: html
	html heading level2; with: 'Loaded versions'.
	html unorderedList: [
		self sortedWorkingCopies do: [ :each |
			html listItem: [
				html text: each description.
				html space.
				html anchor
					callback: [ self newVersion: each ];
					with: 'Save' ] ] ]