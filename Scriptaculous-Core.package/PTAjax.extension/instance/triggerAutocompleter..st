*scriptaculous-core-triggers
triggerAutocompleter: aBlock
	"Triggers an autocompleter, not that you need to define a passanger for the list items to make this work."

	aBlock fixCallbackTemps.
	self
		callback: [ :value | aBlock value: (self renderContext callbacks passengerAt: value) ]
		value: (JSStream on: 'arguments[1].id')