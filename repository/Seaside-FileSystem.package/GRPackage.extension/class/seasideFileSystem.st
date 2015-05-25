*seaside-filesystem
seasideFileSystem
	^ self new
		name: 'Seaside-FileSystem';
		description: 'File library that serves files from external directory.';
		addDependency: 'Seaside-Core';
		url: #seasideLGPLUrl;
		license: #LGPL;
		yourself