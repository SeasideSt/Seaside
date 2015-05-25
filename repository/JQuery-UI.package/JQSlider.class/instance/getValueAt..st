actions
getValueAt: anInteger
	"Gets the values of the slider. For multiple handle or range sliders."

	self action: 'values' arguments: (Array with: anInteger)