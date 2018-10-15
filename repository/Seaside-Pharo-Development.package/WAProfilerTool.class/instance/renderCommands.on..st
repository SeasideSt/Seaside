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
	anItem time > 0
		ifTrue: [
			html anchor
				callback: [ message := anItem stats ];
				with: 'GC Stats' ]
		ifFalse: [
			"avoid ZeroDivide
			https://github.com/SeasideSt/Seaside/issues/968"
			html text: 'GC Stats' ]
 	
