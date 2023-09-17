rendering
renderTodosOn: html

	html section
		id: 'main';
		with: [
			html checkbox
				id: 'toggle-all'.
			html  label 
				for: 'toggle-all';
				with: 'Mark all as complete'.
			html unorderedList
				id: 'todo-list';
				with: [ self todos do: [ :todoItem | todoItem renderOn: html ] ] ]