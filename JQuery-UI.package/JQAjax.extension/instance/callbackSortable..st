*jquery-ui
callbackSortable: aBlock
	"Trigger aBlock with the selectable event object."
	
	self callback: aBlock forEvent: #(
		(passenger helper "the current helper element")
		(passenger item " the current dragged element")
		(passenger placeholder "the placeholder")
		(passenger sender "the sortable where the item comes from")
		(position position "current position of the helper")
		(position offset "current absolute position of the helper"))