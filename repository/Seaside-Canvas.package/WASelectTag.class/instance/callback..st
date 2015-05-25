callbacks
callback: aBlock
	values := Dictionary new.
	self name: (self storeCallback: (self callbackClass on: aBlock values: values))