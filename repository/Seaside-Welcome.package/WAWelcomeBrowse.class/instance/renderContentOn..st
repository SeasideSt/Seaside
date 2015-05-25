rendering
renderContentOn: html
	html heading
		level1
		with: 'Browse installed applications'.
	html anchor
			class: 'goback';
			callback: [ self answer ];
			with: '[ go back ]'.
			
	html paragraph: [
		html text: 'Would you like to set '.
		html anchor
			url: '/browse';
			with: 'Browse'.
		html text: ' to be the default application when you visit this site? This will disable this welcome screen (though you can always find it later at '.
		html anchor
			url: self application url;
			with: self application url.
		html text: ').' ].
		
		html div
			class: 'buttons';
			with: [
			html anchor
				callback: [ self setBrowseAsDefault ];
				script: (html jQuery this button
					primaryIcon: 'ui-icon-pin-s');
				title: 'Yes, change the default';
				with: 'Yes'.	
			html anchor
				callback: [ self redirectToBrowse ];
				script: (html jQuery this button
					primaryIcon: 'ui-icon-folder-open');
				title: 'No, just Browse for now';
				with: 'No'.
			html anchor
				callback: [ self answer ];
				script: (html jQuery this button
					primaryIcon: 'ui-icon-arrowreturnthick-1-w');
				title: 'Go back';
				with: 'Back' ]