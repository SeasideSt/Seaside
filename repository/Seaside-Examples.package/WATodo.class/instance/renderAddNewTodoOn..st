rendering
renderAddNewTodoOn: html
	| newTodo |
	html header
		id: #header;
		with: [
			html form: [
				html heading
					level: 1;
					with: 'todos'.
				html textInput
					id: #'new-todo';
					autofocus;
					attributeAt: 'autocomplete' put: 'off';
					callback: [ :value | newTodo := self addTodo: value ];
					placeholder: 'What needs to be done?' ] ]