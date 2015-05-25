rendering
renderContentOn: html
	html span class: self cssClass; with: [
		html span
			title: 'Callback Time';
			with: filter previousTiming.
		html text: '/'.
		html span
			title: 'Render Time';
			with: filter currentTiming.
		html text: ' ms' ]