configuration
rootComponentClass: aClass
	^ self preferenceAt: #rootComponentClass put: (GRPlatform current bindingOf: aClass)