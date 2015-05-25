initialization
initialize
	super initialize.
	component1 := WAFormDialog new
		addMessage: 'Step 1';
		yourself.
	component2 := WAFormDialog new
		addMessage: 'Step 2';
		yourself