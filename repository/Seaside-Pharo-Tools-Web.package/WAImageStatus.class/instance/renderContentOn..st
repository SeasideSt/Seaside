rendering
renderContentOn: html
	super renderContentOn: html.
	
	html heading level2; with: 'Actions'.
	
	html unorderedList: [
		html listItem: [
			html anchor
				callback: [ self image snapshot: true andQuit: false ];
				with: 'Save' ].
		html listItem: [
			html anchor
				callback: [ self image snapshot: true andQuit: true ];
				with: 'Save and Quit' ].
		html listItem: [
			html anchor
				callback: [ self image snapshot: false andQuit: true ];
				with: 'Quit Without Saving' ] ]