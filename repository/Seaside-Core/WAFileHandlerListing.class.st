Class {
	#name : #WAFileHandlerListing,
	#superclass : #WAObject,
	#instVars : [
		'handler',
		'context'
	],
	#category : 'Seaside-Core-Libraries'
}

{ #category : #'instance creation' }
WAFileHandlerListing class >> on: aFileHandler context: aRequestContext [
	^ self basicNew initializeWithFileHandler: aFileHandler context: aRequestContext; yourself
]

{ #category : #initialization }
WAFileHandlerListing >> initializeWithFileHandler: aFileHandler context: aRequestContext [
	self initialize.
	handler := aFileHandler.
	context := aRequestContext
]

{ #category : #responding }
WAFileHandlerListing >> responseForLibraries [
	self subclassResponsibility
]

{ #category : #responding }
WAFileHandlerListing >> responseForLibrary: aLibrary [
	self subclassResponsibility
]
