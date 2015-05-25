convenience
serializeChildren: aQuery
	"Serialize all input fields being children of aQuery."

	self serialize: (aQuery find: ':input')