attributes-events
onCut: anObject
	"Fired at elements when the user copies the selected data on the clipboard and removes the selection from the document."

	self document scriptGenerator
		event: 'cut'
		do: anObject
		on: self