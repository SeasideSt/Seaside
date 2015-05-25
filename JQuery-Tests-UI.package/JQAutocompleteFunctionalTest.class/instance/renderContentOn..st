rendering
renderContentOn: html
	html label
		for: html nextId;
		with: 'Type a Seaside package name:'.
	html break.
	html textInput
		id: html lastId;
		script: (html jQuery this autocomplete
			sourceCallback: [ :term | self packageNamesFor: term ])