rendering
renderContentOn: html
	html paragraph
		script: (html scriptaculous updater
			interval: 1 seconds;
			on: #renderTimeOn: of: self);
		with: [ self renderTimeOn: html ]