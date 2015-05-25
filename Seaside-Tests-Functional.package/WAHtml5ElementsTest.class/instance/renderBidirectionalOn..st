rendering
renderBidirectionalOn: html
	html heading level2; with: '<bdi>'.
	
	html unorderedList: [
		html listItem: [
			html text: 'User '.
			html bidirectional: 'jcranmer'.
			html text: ' 12 posts.' ].
		html listItem: [
			html text: 'User '.
			html bidirectional: 'hober'.
			html text: ' 5 posts.' ] ]