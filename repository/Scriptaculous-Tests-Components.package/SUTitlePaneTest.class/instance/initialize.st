initialization
initialize
	super initialize.
	component := self coreClass new title: 'Title';
		body: (SUFormTest new)
"		body: (SUCounterTest on: 1); yourself"
		
"		body: (SUCarouselTest new); yourself"

	


	