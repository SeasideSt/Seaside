callbacks
callback: aBlock
	self name: (self storeCallback: (WAEmailCallback on: aBlock)).
	self value: self value