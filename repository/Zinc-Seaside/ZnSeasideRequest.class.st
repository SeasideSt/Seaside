"
I group a ZnRequest together with its stream, purely for convenience.
"
Class {
	#name : #ZnSeasideRequest,
	#superclass : #Object,
	#instVars : [
		'nativeRequest',
		'stream'
	],
	#category : 'Zinc-Seaside'
}

{ #category : #'instance creation' }
ZnSeasideRequest class >> nativeRequest: aZnRequest stream: aStream [
	^ self new
		nativeRequest: aZnRequest;
		stream: aStream
]

{ #category : #accessing }
ZnSeasideRequest >> nativeRequest [
	^ nativeRequest
]

{ #category : #accessing }
ZnSeasideRequest >> nativeRequest: anObject [
	nativeRequest := anObject
]

{ #category : #accessing }
ZnSeasideRequest >> stream [
	^ stream
]

{ #category : #accessing }
ZnSeasideRequest >> stream: anObject [
	stream := anObject
]
