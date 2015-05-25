libraries
removeLibrary: aLibraryClass
	self preferenceAt: #libraries put: (self libraries copyWithout: aLibraryClass)