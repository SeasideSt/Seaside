configuration
rootClass: aComponentClass
	self preferenceAt: #rootClass put: (GRPlatform current bindingOf: aComponentClass)