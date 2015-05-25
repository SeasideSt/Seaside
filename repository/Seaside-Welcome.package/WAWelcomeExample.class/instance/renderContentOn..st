rendering
renderContentOn: html
	html heading level1 with: 'Example: ', self title.
	html anchor
		class: 'goback';
		callback: [ self answer ];
		with: '[ go back ]'.
	self renderExampleOn: html.
		
	html div
		class: 'buttons';
		with: [
			html anchor
				callback: [ self answer ];
				script: (html jQuery this button
					primaryIcon: 'ui-icon-arrowreturnthick-1-w');
				title: 'Go back';
				with: 'Back' ]