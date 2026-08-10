rendering
renderTree: anItem on: html
	html anchor
		callback: [ message := anItem tree ];
		title: 'Tree';
		with: [
			html html: '&#x1f332;']