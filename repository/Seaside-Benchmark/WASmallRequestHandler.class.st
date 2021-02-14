"
I return a static 2 byte array. I'm useful for benchmarking the HTTP server and server adapter for req/s.
"
Class {
	#name : #WASmallRequestHandler,
	#superclass : #WARequestHandler,
	#instVars : [
		'pageContent'
	],
	#category : 'Seaside-Benchmark'
}

{ #category : #'class initialization' }
WASmallRequestHandler class >> register [
	WADispatcher default
		register: self new at: 'small' 
]

{ #category : #handling }
WASmallRequestHandler >> handleFiltered: aRequestContext [
	aRequestContext respond: [ :response |
		response
			binary;
			contentType: WAMimeType textHtml;
			nextPutAll: self pageContent ]
]

{ #category : #private }
WASmallRequestHandler >> pageContent [
	"taken from seaside.st"
	pageContent isNil ifTrue: [
		pageContent := 'OK' asByteArray ].
	^ pageContent
]
