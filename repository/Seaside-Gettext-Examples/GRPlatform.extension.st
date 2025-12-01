Extension { #name : 'GRPlatform' }

{ #category : '*Seaside-Gettext-Examples' }
GRPlatform >> seasideFilesDirectory [
	self subclassResponsibility
]

{ #category : '*Seaside-Gettext-Examples' }
GRPlatform >> seasideGettextExampleFilesDirectory [
	^ self seasideFilesDirectory, self pathSeparator, 'seaside-gettext-example',self pathSeparator, 'locale'
]
