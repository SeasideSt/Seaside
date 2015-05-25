rendering-parts
renderServerUrlOn: html
	| id |
	html div
		id: (id := html nextId);
		class: 'dialog';
	      script: (html jQuery new dialog
			html: WAWelcomeUrlDialog new;
			title: 'Configure server URL';
			resizable: false;
			modal: true).
	html paragraph: [
		html text: 'Public server URL: '; text: self serverUrl; text: ' [ '.
		html anchor
			url: '#';
			onClick: ((html jQuery id: id) dialog open return: false);
			with: 'set'.
		self serverUrl isNil ifFalse: [
			html text: ' / '.
			html anchor
				callback: [ self clearServerUrl ];
				with: 'clear' ].
		html text: ' ]' ]