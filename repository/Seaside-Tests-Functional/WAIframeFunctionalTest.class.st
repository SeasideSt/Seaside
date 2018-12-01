Class {
	#name : #WAIframeFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'batchFunctionalTest'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #actions }
WAIframeFunctionalTest >> batchFunctionalTestLoop [
	self session presenter
		show: WABatchFunctionalTest new
]

{ #category : #hooks }
WAIframeFunctionalTest >> children [
	^ Array with: batchFunctionalTest
]

{ #category : #initialization }
WAIframeFunctionalTest >> initialize [
	super initialize.
	batchFunctionalTest := WABatchFunctionalTest new
]

{ #category : #rendering }
WAIframeFunctionalTest >> renderContentOn: html [
	html paragraph: 'With #contents:'.
	html iframe
		contents: batchFunctionalTest.
	html paragraph: 'With #url:'.
	html iframe
		url: (WATestingFiles / #samplePng).
	html paragraph: 'With #document:'.
	html iframe
		document: WATestingFiles default samplePng
		mimeType: 'image/png'.
	html paragraph: 'With #document:'.
	html iframe
		document: WATestingFiles default samplePng
		mimeType: 'image/png'.
		html paragraph: 'With #callback:'.
	html iframe
		callback: [ self batchFunctionalTestLoop ]
]

{ #category : #hooks }
WAIframeFunctionalTest >> style [
	^ 'iframe {
	border: 1px solid gray;
	width: 100%;
}'
]
