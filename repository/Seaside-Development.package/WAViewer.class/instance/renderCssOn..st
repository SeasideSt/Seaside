rendering
renderCssOn: html
	html textArea
		rows: 20;
		columns: 80;
		value: presenter style;
		callback: [ :css |
			self compile: 'style ', GRPlatform current newline,
				'	^ ', css printString ]