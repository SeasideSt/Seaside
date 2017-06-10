initialization
initialize
	super initialize.
	todos := OrderedCollection new.
	1 to: 5000 do: [ :index | 
		self addTodo: 'Task ', index greaseString ]