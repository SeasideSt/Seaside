rendering
renderContentOn: html
	self renderDownloadOn: html.
	self renderLoadFromFileOn: html.
	self renderLoadFromUrlOn: html.
	self renderSaveImageOn: html