*jquery-ui
callbackAccordion: aBlock
	"Trigger aBlock with the accordion event object."
	
	self callback: aBlock forEvent: #(
		(passenger newHeader "activated header")
		(passenger oldHeader "previous header")
		(passenger newContent "activated content")
		(passenger oldContent "previous content"))