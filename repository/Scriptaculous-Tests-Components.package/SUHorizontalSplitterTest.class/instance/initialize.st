initialization
initialize
	super initialize.
	splitter := SUHorizontalSplitter new
		add: (SUCounterTest on: 1) size: '50px' min: 30;
		add: (SUCounterTest on: 2) size: '50px' min: 30;
		add: (SUCounterTest on: 3) size: '50px' min: 30;
		yourself