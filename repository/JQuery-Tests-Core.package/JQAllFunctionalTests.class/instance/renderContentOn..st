rendering
renderContentOn: html
	html div id: 'canvas'; with: [
		html div id: 'header'; with: [ 
			self renderHeaderOn: html ].
		html div id: 'content'; with: [
			self renderTopOn: html.
			self renderHeadOn: html.
			self renderBodyOn: html.
			self renderBottomOn: html ] ].
	self renderTimeoutOn: html