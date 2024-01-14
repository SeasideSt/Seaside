actions
addTodo: aString
	| newTodo |
	newTodo := WATodoWithJQueryItem newWithDescription: aString in: todos.
	todos add: newTodo.
	^ newTodo