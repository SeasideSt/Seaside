rendering-parts
renderToolsOn: html
	html paragraph: [
		html checkbox
			id: html nextId;
			value: WAAdmin developmentToolsEnabled;
			onTrue: [ WAAdmin enableDevelopmentTools ]
			onFalse: [ WAAdmin disableDevelopmentTools ];
			onChange: (html jQuery ajax serializeForm).
		html label
			for: html lastId;
			with: 'Show development toolbar' ]