libraries
addLibrary: aLibraryClass
	self preferenceAt: #libraries put: (self libraries copyWith: aLibraryClass)