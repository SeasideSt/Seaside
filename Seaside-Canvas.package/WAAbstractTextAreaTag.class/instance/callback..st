callbacks
callback: aBlock
	self name: (self storeCallback: (WAValueCallback on: aBlock)).
	self value: self value