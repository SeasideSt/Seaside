Extension { #name : #GRPlatform }

{ #category : #'*seaside-filesystem' }
GRPlatform >> defaultDirectoryPathString [
	self subclassResponsibility 
]

{ #category : #'*seaside-filesystem' }
GRPlatform >> fileNameFor: aPathString [
	self subclassResponsibility 
]

{ #category : #'*seaside-filesystem' }
GRPlatform >> isDirectory: aPathString [
	self subclassResponsibility 
]
