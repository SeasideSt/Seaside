configuration
sessionClass: aClass
	^ self preferenceAt: #sessionClass put: (GRPlatform current bindingOf: aClass)