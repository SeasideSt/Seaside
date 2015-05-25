initialization
initialize
	super initialize.
	splitter := SUVerticalSplitter new
		add: (SUCounterTest on: 1) size: '150px' min: 60;
		add: (SUCounterTest on: 2) size: '150px' min: 80;
		add: (SUCounterTest on: 3) size: '150px' min: 80;
		yourself