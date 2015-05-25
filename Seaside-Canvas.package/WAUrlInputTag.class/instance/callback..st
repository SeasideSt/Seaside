callbacks
callback: aBlock
	self name: (self storeCallback: (WAUrlCallback on: aBlock)).
	self value: self value