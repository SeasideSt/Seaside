rendering
renderModificationOn: html

	html heading level2; with: '<ins>, <del>'.

	html paragraph: [
		html text: 'A Sheriff can employ '.
		html deleted
			title: 'Changed as a result of the SECURE bill.';
			cite: 'http://www.w3.org/TR/html401/struct/text.html#edef-del';
			datetime: '1994-11-05T08:15:30-05:00';
			with: 3.
		html inserted
			title: 'Changed as a result of the SECURE bill.';
			cite: 'http://www.w3.org/TR/html401/struct/text.html#edef-del';
			datetime: '1994-11-05T08:15:30-05:00';
			with: 5.
		html text: ' deputies.' ]