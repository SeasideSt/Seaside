options-generated
connectToSortable: aSelector
	"Allows the draggable to be dropped onto the specified sortables. If this option is used (helper must be set to 'clone' in order to work flawlessly), a draggable can be dropped onto a sortable list and then becomes part of it. Note: Specifying this option as an array of selectors has been removed."

	self optionAt: 'connectToSortable' put: aSelector