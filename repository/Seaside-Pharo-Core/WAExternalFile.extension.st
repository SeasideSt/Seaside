Extension { #name : 'WAExternalFile' }

{ #category : '*Seaside-Pharo-Core' }
WAExternalFile >> fileReference [
	^ self fullyQualifiedFilePath asFileReference
]
