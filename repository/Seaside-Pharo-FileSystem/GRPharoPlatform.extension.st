Extension { #name : #GRPharoPlatform }

{ #category : #'*seaside-pharo-filesystem' }
GRPharoPlatform >> defaultDirectoryPathString [
	^ FileSystem workingDirectory fullName
]

{ #category : #'*seaside-pharo-filesystem' }
GRPharoPlatform >> fileNameFor: aPathString [
	^ aPathString asFileReference fullName
]

{ #category : #'*seaside-pharo-filesystem' }
GRPharoPlatform >> isDirectory: aPathString [
	^ aPathString asFileReference isDirectory
]
