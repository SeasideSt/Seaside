rendering
renderHeaderWithAddTodoOn: html

	html header
		id: #header;
		with: [
			html heading
				level: 1;
				with: 'todos'.
			self renderAddNewTodoOn: html ]