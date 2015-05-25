initialization
initializeWithKey: keySymbol
	self initialize.
	key := keySymbol.
	attributeHolders := Set new.
	attributeInheritors := Set new.
	cachedValues := Dictionary new