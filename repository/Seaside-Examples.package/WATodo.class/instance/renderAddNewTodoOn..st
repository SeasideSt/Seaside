rendering
renderAddNewTodoOn: html
	| newTodo |
	html header
		id: #header;
		with: [
			html heading
				level: 1;
				with: 'todos'.
			html textInput
				id: #'new-todo';
				autofocus;
				attributeAt: 'autocomplete' put: 'off';
				callback: [ :value | newTodo := self addTodo: value ];
				"onChange: (html jQuery ajax 
								serializeThis;
								onComplete: ((html jQuery ajax script: [:s | s << ((s jQuery id: 'todo-list') append: newTodo)]),
											   ((html jQuery id: #'new-todo') value: '')));"
				onChange: (html jQuery ajax 
								serializeThis;
								script: [ :s | s << ((s jQuery id: 'todo-list') append: newTodo) ];
								onComplete: ((html jQuery id: #'new-todo') value: ''));
				placeholder: 'What needs to be done?' ]