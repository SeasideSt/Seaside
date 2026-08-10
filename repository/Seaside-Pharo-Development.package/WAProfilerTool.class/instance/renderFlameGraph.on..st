rendering
renderFlameGraph: anItem on: html
	html anchor
		callback: [ message := WAFlameGraph on: anItem tally ];
		title: 'Flame Graph';
		with: [
			html html: '&#x1F525;' ]