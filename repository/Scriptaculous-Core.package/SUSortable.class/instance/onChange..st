events
onChange: anObject
	"Called whenever the sort order changes while dragging. When dragging from one Sortable to another, the callback is called once on each Sortable."

	self optionAt: 'onChange' put: anObject asFunction