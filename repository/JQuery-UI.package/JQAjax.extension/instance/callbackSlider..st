*jquery-ui
callbackSlider: aBlock
	"Trigger aBlock with the slider event object."
	
	self callback: aBlock forEvent: #(
		(passenger handle "the current focused handle")
		(number value "the current handle's value"))