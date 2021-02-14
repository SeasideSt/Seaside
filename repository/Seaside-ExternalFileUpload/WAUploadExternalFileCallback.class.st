Class {
	#name : #WAUploadExternalFileCallback,
	#superclass : #WAUploadCallback,
	#category : 'Seaside-ExternalFileUpload'
}

{ #category : #converting }
WAUploadExternalFileCallback >> valueForField: anObject [
	| postFields filename filetype location |
	postFields := self requestContext request postFields.
	filename := postFields at: key , '.name' ifAbsent: [ nil ].
	filetype := WAMimeType fromString: (postFields at: key , '.content_type' ifAbsent: [ '' ]).
	location := postFields at: key , '.path' ifAbsent: [ nil ].
	^ filename
		ifNotNil: [ WAExternalFile new
				fileName: filename;
				contentType: filetype;
				filePath: location ]
]
