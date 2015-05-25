convenience
serializeForm: aQuery
	"Serialize all input fields of the form matching aQuery."

	self serializeChildren: (aQuery closest: 'form')