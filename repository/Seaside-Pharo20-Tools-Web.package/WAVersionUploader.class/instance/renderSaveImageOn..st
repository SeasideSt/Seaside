rendering
renderSaveImageOn: html
	html anchor
		callback: [ self saveImage ];
		with: 'Save Image'