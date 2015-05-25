actions
setValue: aNumber at: anInteger
	"Sets the values of the slider. For multiple handle or range sliders."

	self action: 'values' arguments: (Array with: aNumber with: anInteger)