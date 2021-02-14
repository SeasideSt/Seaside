Class {
	#name : #WAStreamedResponseTest,
	#superclass : #WAResponseTest,
	#category : 'Seaside-Tests-Core-HTTP'
}

{ #category : #private }
WAStreamedResponseTest >> assertLines: anArray [
	"Streamed responses don't have content length information. They simply can't know."
	
	super assertLines: (anArray reject: [ :each | each beginsWithSubCollection: 'Content-Length' ])
]

{ #category : #accessing }
WAStreamedResponseTest >> contents [
	self response flush.
	^ self response stream contents
]

{ #category : #accessing }
WAStreamedResponseTest >> response [
	^ super response ifNil: [ response := WAStreamedResponse on: (WriteStream on: String new) ]
]

{ #category : #'tests-conveniance' }
WAStreamedResponseTest >> testCanResetIfNoBody [
	| resetPossible |
	resetPossible := self response
		status: WAResponse statusNotFound;
		attachmentWithFileName: 'upload.csv';
		resetIfPossible.
	self assert: resetPossible.
	self assertLines: #('HTTP/1.1 200 OK' 'Content-Length: 0' '')
]

{ #category : #'tests-conveniance' }
WAStreamedResponseTest >> testCantReset [
	| resetPossible |
	resetPossible := self response
		status: WAResponse statusNotFound;
		attachmentWithFileName: 'upload.csv';
		nextPutAll: 'the content';
		resetIfPossible.
	self deny: resetPossible.
	self assertLines: #('HTTP/1.1 404 Not Found' 'Content-Disposition: attachment; filename="upload.csv"' '' 'the content')
]

{ #category : #'tests-state' }
WAStreamedResponseTest >> testCookieAfterCommit [
	self response flush.
	self 
		should: [ self response addCookie: WACookie new ]
		raise: WAIllegalStateException
]

{ #category : #'tests-flush' }
WAStreamedResponseTest >> testFlushDelay [
	self response forbidden.
	self response headerAt: 'X-Application-Server' put: 'Seaside'.
	self deny: self response isCommitted.
	self 
		shouldnt: [ self response committedCheck ]
		raise: WAIllegalStateException
]

{ #category : #'tests-flush' }
WAStreamedResponseTest >> testFlushNextPutAll [
	self response nextPutAll: 'Hello World'. " <-- should flush "
	self assert: self response isCommitted.
	self 
		should: [ self response committedCheck ]
		raise: WAIllegalStateException.
	self assertLines: #('HTTP/1.1 200 OK' '' 'Hello World')
]

{ #category : #'tests-flush' }
WAStreamedResponseTest >> testFlushStream [
	self response stream. " <-- should flush "
	self assert: self response isCommitted.
	self 
		should: [ self response committedCheck ]
		raise: WAIllegalStateException.
	self assertLines: #('HTTP/1.1 200 OK' '')
]

{ #category : #'tests-state' }
WAStreamedResponseTest >> testHeaderAfterCommit [
	self response flush.
	self 
		should: [ self response headerAt: 'foo' put: 'bar' ]
		raise: WAIllegalStateException.
	self 
		should: [ self response headerAt: 'foo' append: 'bar' ]
		raise: WAIllegalStateException.
	self 
		should: [ self response removeHeaderAt: 'foo' ]
		raise: WAIllegalStateException
]

{ #category : #tests }
WAStreamedResponseTest >> testIsCommitted [
	super testIsCommitted.
	self assert: self response isCommitted
]

{ #category : #'tests-state' }
WAStreamedResponseTest >> testStatusAfterCommit [
	self response flush.
	self 
		should: [ self response forbidden ]
		raise: WAIllegalStateException.
	self 
		should: [ self response status: 404 message: 'Almost found' ]
		raise: WAIllegalStateException
]
