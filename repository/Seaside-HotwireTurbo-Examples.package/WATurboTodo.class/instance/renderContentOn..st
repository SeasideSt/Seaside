rendering
renderContentOn: html

	html section
		id: #todoapp;
		with: [
			self renderHeaderWithAddTodoOn: html.
			self renderTodosOn: html.
			self renderFooterOn: html ]