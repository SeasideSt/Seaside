actions
setValue: aNumber
	"Sets the value of the slider. For single handle sliders."

	self action: 'value' arguments: (Array with: aNumber)