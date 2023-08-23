actions
addTodo: aString

	| newTodo |
	newTodo := WATurboTodoItem newWithDescription: aString in: todos.
	newTodo addDecoration: WATurboFrame new.
	todos add: newTodo.
	^ newTodo