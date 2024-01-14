rendering
renderAddNewTodoOn: html

	| newTodo |
	html form
		id: 'new-todo-form';
		turboStreamCallback: [ :ts | 
			ts 
				append: 'todo-list' with: newTodo;
				replace: 'new-todo-form' with: [ :r | self renderAddNewTodoOn: r ] ];
		with: [
			html textInput
				id: 'new-todo';
				autofocus;
				noAutocomplete;
				callback: [ :value | newTodo := self addTodo: value ];
				placeholder: 'What needs to be done?' ]