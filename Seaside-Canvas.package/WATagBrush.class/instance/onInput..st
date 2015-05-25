convenience
onInput: anObject
	"Any element that accepts an onchange attribute to handle change events shall also accept an oninput  attribute to handle input events, except the output element (for which it would make no sense)."

	self document scriptGenerator
		event: 'input'
		do: anObject
		on: self