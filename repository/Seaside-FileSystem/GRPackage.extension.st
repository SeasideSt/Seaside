Extension { #name : #GRPackage }

{ #category : #'*seaside-filesystem' }
GRPackage classSide >> seasideFileSystem [
	^ self new
		name: 'Seaside-FileSystem';
		description: 'File library that serves files from external directory.';
		addDependency: 'Seaside-Core';
		url: #seasideLGPLUrl;
		license: #LGPL;
		yourself
]
