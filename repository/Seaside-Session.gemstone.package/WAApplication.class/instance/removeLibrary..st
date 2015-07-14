libraries
removeLibrary: aLibraryClass
	self
		preferenceAt: #libraries
		put: ((self preferenceAt: #libraries) reject: [ :each | each value = aLibraryClass ])