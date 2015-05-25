*jquery-ui
callbackResizable: aBlock
	"Trigger aBlock with the resizeable event object."
	
	self callback: aBlock forEvent: #(
		(passenger helper "the helper element")
		(position originalPosition "position before resizing started") 
		(position position "current position")
		(size originalSize "size before resizing started")
		(size size "current size"))