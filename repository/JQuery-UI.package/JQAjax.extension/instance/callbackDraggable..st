*jquery-ui
callbackDraggable: aBlock
	"Trigger aBlock with the draggable event object."
	
	self callback: aBlock forEvent: #(
		(passenger helper "the helper that's being dragged")
		(position position "current position of the helper")
		(position offset "current absolute position of the helper"))