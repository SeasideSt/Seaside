Class {
	#name : #CTHandler,
	#superclass : #WAObject,
	#instVars : [
		'id',
		'pusher',
		'session',
		'response'
	],
	#category : 'Comet-Core'
}

{ #category : #'instance creation' }
CTHandler class >> on: aPusher [
	^ self basicNew initializeOn: aPusher
]

{ #category : #private }
CTHandler >> basicConnect: aRequestContext [
	session := aRequestContext session.
	response := aRequestContext response.
	response
		doNotCache;
		contentType: aRequestContext application contentType;
		nextPutAll: (self preambleFor: aRequestContext);
		nextPutAll: ((String new: 1024) atAllPut: Character space);
		flush "<- sends partial content"
]

{ #category : #private }
CTHandler >> basicDisconnect [
	response ifNil: [ ^ self ].
	response destroy.
	response := nil
]

{ #category : #private }
CTHandler >> basicTerminate [
	thisContext swapSender: nil.
	Processor activeProcess terminate
]

{ #category : #actions }
CTHandler >> connect: aRequestContext [
	self
		basicDisconnect;
		basicConnect: aRequestContext.
	self pusher register: self.
	self basicTerminate
]

{ #category : #accessing }
CTHandler >> id [
	^ id
]

{ #category : #initialization }
CTHandler >> initializeOn: aPusher [
	self initialize.
	id := WAKeyGenerator current 
		keyOfLength: 16.
	pusher := aPusher
]

{ #category : #private }
CTHandler >> notifySession [
	self session application cache 
		notifyRetrieved: self session 
		key: self session key
]

{ #category : #private }
CTHandler >> preambleFor: aRequestContext [
	^ '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"><head><title>Comet</title></head><body>'
		, ((String new: 1024) atAllPut: Character space)
]

{ #category : #actions }
CTHandler >> push: aString [
	"Push aString to the receiver. Notify the session about the update, so that it does not timeout. Answer true, if the connection is still valid."

	| success |
	response isNil
		ifTrue: [ ^ false ].
	success := [ response nextPutAll: aString; flushComet ]
		on: Error
		do: [ :err | ^ false ].
	success
		ifTrue: [ self notifySession ].
	^ success
]

{ #category : #accessing }
CTHandler >> pusher [
	^ pusher
]

{ #category : #accessing }
CTHandler >> session [
	^ session
]
