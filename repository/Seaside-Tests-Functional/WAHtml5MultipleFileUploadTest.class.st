Class {
	#name : #WAHtml5MultipleFileUploadTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'files'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #rendering }
WAHtml5MultipleFileUploadTest >> renderContentOn: html [
	self renderUploadOn: html.
	self renderFilesOn: html
]

{ #category : #rendering }
WAHtml5MultipleFileUploadTest >> renderFilesOn: html [
	files isNil ifTrue: [ ^ self ].
	html unorderedList: [
		files do: [ :each |
			html listItem: each fileName ] ]
]

{ #category : #rendering }
WAHtml5MultipleFileUploadTest >> renderUploadOn: html [

	html form
		multipart;
		with: [
			html div: [
				"div for HTML validation"
				html fileUpload
					multipleValuesCallback: [ :f | files := f ].
				html submitButton ] ]
]
