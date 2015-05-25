*jquery-ui
callbackTabs: aBlock
	"Trigger aBlock with the tabs event object."
	
	self callback: aBlock forEvent: #(
		(passenger tab "anchor element of the selected (clicked) tab")
		(passenger panel "element, that contains the selected/clicked tab contents")
		(number index "zero-based index of the selected (clicked) tab"))