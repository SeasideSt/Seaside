callbacks
callback: aBlock
	"Only called if option was selected."
	
	self attributes at: 'value' put: (self storeCallback: (WAValueCallback on: aBlock))