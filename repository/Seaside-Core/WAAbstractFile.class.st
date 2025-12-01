Class {
	#name : 'WAAbstractFile',
	#superclass : 'WAObject',
	#instVars : [
		'contentType',
		'fileName'
	],
	#category : 'Seaside-Core-HTTP',
	#package : 'Seaside-Core',
	#tag : 'HTTP'
}

{ #category : 'accessing' }
WAAbstractFile >> contentType [
	^ contentType
]

{ #category : 'accessing' }
WAAbstractFile >> contentType: aMimeTypeOrString [
	contentType := aMimeTypeOrString isNil
		ifFalse: [ aMimeTypeOrString seasideMimeType ]
]

{ #category : 'accessing' }
WAAbstractFile >> contentsDecodedUsing: aCharSetName [
	"Answer the contents decoded using the given character set name."
	^ (GRCodec forEncoding: aCharSetName) decode: self rawContents
]

{ #category : 'accessing' }
WAAbstractFile >> fileName [
	^ fileName
]

{ #category : 'accessing' }
WAAbstractFile >> fileName: aString [
	fileName := aString
]

{ #category : 'accessing' }
WAAbstractFile >> rawContents [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
WAAbstractFile >> size [
	^ self subclassResponsibility
]
