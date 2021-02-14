Class {
	#name : #WAFileUploadExample,
	#superclass : #WAExampleComponent,
	#instVars : [
		'file'
	],
	#category : 'Seaside-ExternalFileUpload-Examples'
}

{ #category : #'as yet unclassified' }
WAFileUploadExample class >> description [
	^ 'A very simple Seaside application'
]

{ #category : #'as yet unclassified' }
WAFileUploadExample class >> handlerName [
	^ 'examples/testupload'
]

{ #category : #'as yet unclassified' }
WAFileUploadExample class >> initialize [
	WAAdmin register: self asApplicationAt: self handlerName
]

{ #category : #rendering }
WAFileUploadExample >> renderContentOn: html [
	html form
		multipart;
		with: [ 
					html fileUpload 
						callback: [ :f | file := f ].
					html submitButton
						text: 'Upload file directly' ].
					
	html form
		multipart;
		fileUploadLocation: 'fileupload';
		with: [ 
					html externalFileUpload 
						callback: [ :ef | file := ef ].
					html submitButton
						text: 'Upload file via front-end' ].
					
	file
		ifNotNil: [ 
			html anchor
				target: '_blank';
				callback: [ 
							self requestContext
								respond: [ :response | 
									response
										contentType: file contentType;
										document: file rawContents asString;
										attachmentWithFileName: file fileName ] ];
				with: 'Download ' , file fileName ]
]

{ #category : #hooks }
WAFileUploadExample >> states [
	^ Array with: self
]
