initialization
initialize

	super initialize.
	todos := OrderedCollection new.
	1 to: 10 do: [ :index | 
		self addTodo: ('Task {1}' format: { index greaseString }) ]