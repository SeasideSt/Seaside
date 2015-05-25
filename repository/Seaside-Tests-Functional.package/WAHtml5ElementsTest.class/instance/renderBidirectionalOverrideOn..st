rendering
renderBidirectionalOverrideOn: html
	html heading level2; with: '<bdo>'.
	
	html unorderedList: [
		html listItem: [
			html text: 'User '.
			html bidirectionalOverride
				direction: 'rtl';
				with: 'jcranmer'.
			html text: ' 12 posts.' ].
		html listItem: [
			html text: 'User '.
			html
				bidirectionalOverride
				direction: 'ltr';
				with: 'hober'.
			html text: ' 5 posts.' ] ]