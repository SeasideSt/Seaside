Class {
	#name : #WAMimeTypeStubHandler,
	#superclass : #WARestfulHandler,
	#category : 'Seaside-Tests-REST-Core'
}

{ #category : #'request-handling' }
WAMimeTypeStubHandler >> processApplicationXml [
	<get>
	<path: 'index'>
	<consumes: 'application/xml'>
	
]

{ #category : #'request-handling' }
WAMimeTypeStubHandler >> processTwo [
	<get>
	<path: 'index'>
	<consumes: 'foo/bar'>
	<consumes: 'zork/fnord'>
	
]

{ #category : #'request-handling' }
WAMimeTypeStubHandler >> processXml [
	<get>
	<path: 'index'>
	<consumes: '*/xml'>
	
]

{ #category : #'request-handling' }
WAMimeTypeStubHandler >> produceJpeg [
	<get>
	<path: 'index'>
	<produces: 'image/jpeg'>
	
]

{ #category : #'request-handling' }
WAMimeTypeStubHandler >> producePng [
	<get>
	<path: 'index'>
	<produces: 'image/png'>
	
]
