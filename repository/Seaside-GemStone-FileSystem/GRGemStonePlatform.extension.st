Extension { #name : #GRGemStonePlatform }

{ #category : #'*seaside-gemstone-filesystem' }
GRGemStonePlatform >> defaultDirectoryPathString [
	^ FileDirectory default pathName
]

{ #category : #'*seaside-gemstone-filesystem' }
GRGemStonePlatform >> fileNameFor: aPathString [
  "aa
"

  ^ (FileDirectory on: aPathString) pathName
]

{ #category : #'*seaside-gemstone-filesystem' }
GRGemStonePlatform >> isDirectory: aPathString [
	^ GsFile _isDirectory: aPathString onClient: FileDirectory onClient
]
