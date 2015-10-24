initialization
initialize
	super initialize.
	todos := OrderedCollection new.
	1 to: 5000 do:[:i | 
		self addTodo: 'Task ',i asString]