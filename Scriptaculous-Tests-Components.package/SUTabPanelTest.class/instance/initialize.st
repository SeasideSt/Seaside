initialization
initialize
	super initialize.
	tabPanel := SUTabPanel new
		add: (SUCounterTest on: 1) label: 'Counter 1';
		add: (SUCounterTest on: 2) label: 'Counter 2';
		add: (SUCounterTest on: 3) label: 'Counter 3';
		yourself