rendering
renderSideBarOn: html
	html space.
	html form
		action: 'http://www.google.com/search';
		get;
		with: [
			html hiddenInput
				value: 'site:seaside.st';
				name: 'q'.

			html textInput
				name: 'q'.
			html submitButton: 'Search'.
			html text: ' the Seaside site' ].
	
	self renderSideBarJoinTheCommunityOn: html.
	self renderSideBarDivingInOn: html