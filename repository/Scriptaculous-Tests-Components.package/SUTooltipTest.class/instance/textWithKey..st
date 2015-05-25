accessing
textWithKey: aKey
	self text: (self class tooltips at: aKey asSymbol ifAbsent: [ 'Tooltip for key "', aKey , '" not found!' ])