actions
addTodo: aString
	| newTodo |
	newTodo := WATodoItem newWithDescription: aString in: todos.
	todos add: newTodo.
	^ newTodo