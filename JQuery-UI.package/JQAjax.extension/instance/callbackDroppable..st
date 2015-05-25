*jquery-ui
callbackDroppable: aBlock
	"Trigger aBlock with the droppable event object."
	
	self callback: aBlock forEvent: #(
		(passenger draggable "current draggable element")
		(passenger helper "current draggable helper")
		(position position "current position of the draggable helper")
		(position offset "current absolute position of the draggable helper"))