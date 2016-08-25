rendering
renderContentOn: html
	html section
		id: #todoapp;
		with: [
			self renderAddNewTodoOn: html.
			self renderTodosOn: html.
			self renderFooterOn: html ]