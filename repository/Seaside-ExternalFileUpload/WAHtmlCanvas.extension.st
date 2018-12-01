Extension { #name : #WAHtmlCanvas }

{ #category : #'*seaside-externalfileupload' }
WAHtmlCanvas >> externalFileUpload [
	^ self brush: WAExternalFileUploadTag new
]
