"
A WATestServerAdaptor is a stub of a server adaptor. It doesn't start an adaptor, it just pretends to allow testing of the server manager
"
Class {
	#name : #WATestServerAdaptor,
	#superclass : #WAServerAdaptor,
	#instVars : [
		'status'
	],
	#category : 'Seaside-Tests-Core-Server'
}

{ #category : #'converting-request' }
WATestServerAdaptor >> basicStop [
	status := #stopped
]

{ #category : #testing }
WATestServerAdaptor >> isRunning [
	^ status = #running
]

{ #category : #testing }
WATestServerAdaptor >> isStarting [
	^ status = #starting
]

{ #category : #testing }
WATestServerAdaptor >> isStopped [
	^ status = #stopped
]

{ #category : #testing }
WATestServerAdaptor >> isStopping [
	^ status = #stopping
]

{ #category : #'converting-request' }
WATestServerAdaptor >> requestAddressFor: aNativeRequest [
	self shouldNotImplement
]

{ #category : #'converting-request' }
WATestServerAdaptor >> requestBodyFor: aNativeRequest [
	self shouldNotImplement
]

{ #category : #'converting-request' }
WATestServerAdaptor >> requestCookiesFor: aNativeRequest [
	self shouldNotImplement
]

{ #category : #'converting-request' }
WATestServerAdaptor >> requestFieldsFor: aNativeRequest [
	self shouldNotImplement
]

{ #category : #'converting-request' }
WATestServerAdaptor >> requestHeadersFor: aNativeRequest [
	self shouldNotImplement
]

{ #category : #'converting-request' }
WATestServerAdaptor >> requestMethodFor: aNativeRequest [
	self shouldNotImplement
]

{ #category : #'converting-request' }
WATestServerAdaptor >> requestVersionFor: aNativeRequest [
	self shouldNotImplement
]

{ #category : #converting }
WATestServerAdaptor >> responseFrom: aRequestContext [
	self shouldNotImplement
]

{ #category : #initialization }
WATestServerAdaptor >> running [
	status := #running
]

{ #category : #initialization }
WATestServerAdaptor >> starting [
	status := #starting
]

{ #category : #initialization }
WATestServerAdaptor >> stopped [
	status := #stopped
]

{ #category : #initialization }
WATestServerAdaptor >> stopping [
	status := #stopping
]
