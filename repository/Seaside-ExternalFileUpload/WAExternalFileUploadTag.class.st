Class {
	#name : #WAExternalFileUploadTag,
	#superclass : #WAFileUploadTag,
	#category : 'Seaside-ExternalFileUpload'
}

{ #category : #callbacks }
WAExternalFileUploadTag >> callback: aBlock [
	"Only called if a file was selected."
	self name: (self storeCallback: (WAUploadExternalFileCallback on: aBlock))
]
