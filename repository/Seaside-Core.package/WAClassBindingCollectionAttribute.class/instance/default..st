accessing
default: aCollection
	default := aCollection collect: [ :each |
		GRPlatform current bindingOf: each ]