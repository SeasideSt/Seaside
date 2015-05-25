adding
addAllTo: aCollectionOfEmailAddress
	aCollectionOfEmailAddress do: [ :each |
		self addTo: each ]