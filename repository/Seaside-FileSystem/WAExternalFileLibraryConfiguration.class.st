Class {
	#name : #WAExternalFileLibraryConfiguration,
	#superclass : #WASystemConfiguration,
	#category : 'Seaside-FileSystem'
}

{ #category : #description }
WAExternalFileLibraryConfiguration >> describeOn: config [
	(config string: #directory)
		label: 'Directory';
		comment: 'The base directory to serve files from.';
		default: GRPlatform current defaultDirectoryPathString.
	(config boolean: #listing)
		label: 'Allow Listing';
		comment: 'Enable listing of directory entries.';
		default: false
]
