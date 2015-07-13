configuration
scriptGeneratorClass: aClass
	self preferenceAt: #scriptGeneratorClass put: (GRPlatform current bindingOf: aClass)