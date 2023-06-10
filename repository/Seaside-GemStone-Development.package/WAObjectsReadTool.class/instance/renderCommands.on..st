accessing
renderCommands: anItem on: html
	html anchor
		callback: [ message := anItem report ];
		with: 'Report'.