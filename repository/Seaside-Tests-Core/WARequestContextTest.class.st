Class {
	#name : #WARequestContextTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Core-RequestHandling'
}

{ #category : #configuration }
WARequestContextTest >> createCodec [
	^ GRNullCodec new
]

{ #category : #configuration }
WARequestContextTest >> createRequest [
	^ WARequest new
]

{ #category : #configuration }
WARequestContextTest >> createRequestContext [
	^ WARequestContext request: self createRequest response: self createResponse codec: self createCodec
]

{ #category : #configuration }
WARequestContextTest >> createResponse [
	^ WABufferedResponse new
]

{ #category : #tests }
WARequestContextTest >> testNewDocumentNotHandler [
	"regression test for
	http://code.google.com/p/seaside/issues/detail?id=653"
	| context document |
	context := self createRequestContext.
	document := context newDocument.
	self assert: document notNil
]
