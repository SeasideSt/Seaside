converting
requestFor: aNativeRequest
	aNativeRequest multiValueFormFieldsEnable.
	aNativeRequest isPostMultipart 
		ifTrue: [ self processMultipartFields: aNativeRequest ].
	^ super requestFor: aNativeRequest