rendering-parts
renderWalkbacksOn: html
	html paragraph: [
		html checkbox
			id: html nextId;
			value: self errorWalkbacksEnabled;
			onTrue: [ self enableErrorWalkbacks ]
			onFalse: [ self disableErrorWalkbacks ];
			onChange: (html jQuery ajax serializeForm).
		html label
			for: html lastId;
			with: 'Allow debugging of errors' ]