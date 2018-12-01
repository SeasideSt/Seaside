Class {
	#name : #WABufferedResponseTest,
	#superclass : #WAResponseTest,
	#category : 'Seaside-Tests-Core-HTTP'
}

{ #category : #accessing }
WABufferedResponseTest >> contents [
	| stream |
	stream := WriteStream on: String new.
	self response writeOn: stream.
	^ stream contents
]

{ #category : #accessing }
WABufferedResponseTest >> response [
	^ super response ifNil: [ response := WABufferedResponse new ]
]

{ #category : #'tests-conveniance' }
WABufferedResponseTest >> testEmptyAfterReset [
	| resetPossible |
	resetPossible := self response
		status: WAResponse statusNotFound;
		attachmentWithFileName: 'upload.csv';
		nextPutAll: 'the content';
		resetIfPossible.
	self assert: resetPossible.
	self assertLines: #('HTTP/1.1 200 OK' 'Content-Length: 0' '')
]

{ #category : #tests }
WABufferedResponseTest >> testIsCommitted [
	super testIsCommitted.
	self deny: self response isCommitted
]

{ #category : #'tests-conveniance' }
WABufferedResponseTest >> testResetThenWrite [
	| resetPossible |
	resetPossible := self response
		status: WAResponse statusNotFound;
		attachmentWithFileName: 'upload.csv';
		nextPutAll: 'the wrong content';
		resetIfPossible.
	self assert: resetPossible.
	self response
		status: WAResponse statusImATeapot;
		headerAt: 'X-The-Header' put: 'the value';
		nextPutAll: 'the real content'.
	self assertLines: #('HTTP/1.1 418 I''m a teapot' 'X-The-Header: the value' 'Content-Length: 16' '' 'the real content')
]
