actions
setValue: aNumber
	"This method sets the current value of the progressbar."

	self action: 'value' arguments: (Array with: aNumber)