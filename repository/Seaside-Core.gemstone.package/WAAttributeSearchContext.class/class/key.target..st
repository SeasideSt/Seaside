instance creation
key: keySymbol target: targetConfiguration
	^ self basicNew
		initializeWithKey: keySymbol;
		findAttributeAndSelectAncestorsOf: targetConfiguration;
		yourself