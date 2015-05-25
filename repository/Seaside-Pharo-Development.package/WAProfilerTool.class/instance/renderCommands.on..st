rendering
renderCommands: anItem on: html
	html anchor
		callback: [ message := anItem tree ];
		with: 'Tree'.
	html text: ' '.
	html anchor
		callback: [ message := anItem leavesByTime ];
		with: 'Leaves (time)'.
		html text: ' '.
	html anchor
		callback: [ message := anItem leavesBySends ];
		with: 'Leaves (sends)'.
	html text: ' '.
	html anchor
		callback: [ message := anItem stats ];
		with: 'Stats'
