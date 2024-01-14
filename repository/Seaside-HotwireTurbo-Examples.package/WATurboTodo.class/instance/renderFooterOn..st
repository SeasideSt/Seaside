rendering
renderFooterOn: html

	html footer
		id: #footer;
		with: [ 
			html span
				id: #'todo-count';
				with: todos size ]