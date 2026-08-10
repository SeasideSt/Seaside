rendering
renderCommands: anItem on: html
	self renderTree: anItem on: html.
	html text: ' '.
	self renderLeavesByTime: anItem on: html.
	html text: ' '.
	self renderLeavesBySends: anItem on: html.
	html text: ' '.
	self renderGcStats: anItem on: html.
	html text: ' '.
	self renderFlameGraph: anItem on: html