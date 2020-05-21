initialization
initializeStaticDelegate
	^ ZnStaticFileServerDelegate new
		directory: self wwwRootDirectory;
		yourself