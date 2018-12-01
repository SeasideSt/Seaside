Extension { #name : #WABasicFormTag }

{ #category : #'*seaside-externalfileupload' }
WABasicFormTag >> fileUploadLocation: aLocationString [
	self action: (canvas actionUrl copy addToPath: aLocationString)
]
