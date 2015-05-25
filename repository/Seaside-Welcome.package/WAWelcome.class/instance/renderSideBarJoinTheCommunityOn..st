rendering
renderSideBarJoinTheCommunityOn: html
	html heading
		level: 3; 
		with: 'Join the community'.
		
	html unorderedList: [
		html listItem: [
			html text: 'Join the '.
			html anchor
				url: 'http://lists.squeakfoundation.org/cgi-bin/mailman/listinfo/seaside';
				with: 'mailing list'.
			html text: ' to ask questions and get help.' ] ].

	html form
		action: 'http://www.google.com/search';
		get;
		with: [
			html hiddenInput
				value: 'site:lists.squeakfoundation.org/pipermail/seaside/';
				name: 'q'.
			html textInput
				name: 'q'.
			html submitButton: 'Search'.
			html text: ' the mailing list' ]
