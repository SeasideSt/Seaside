libraries
addLibrary: aLibraryClass
	self
		preferenceAt: #libraries
		put: ((self preferenceAt: #libraries) copyWith: (GRPlatform current bindingOf: aLibraryClass))