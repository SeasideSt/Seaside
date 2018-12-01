Class {
	#name : #WAXmlRoot,
	#superclass : #WARoot,
	#instVars : [
		'charSet'
	],
	#category : 'Seaside-Core-Document'
}

{ #category : #accessing }
WAXmlRoot class >> defaultCharSet [
	^ 'UTF-8'
]

{ #category : #accessing }
WAXmlRoot >> charSet [
	^ charSet ifNil: [ charSet := self class defaultCharSet ]
]

{ #category : #accessing }
WAXmlRoot >> charSet: aString [
	charSet := aString
]

{ #category : #writing }
WAXmlRoot >> openOn: aDocument [
	super openOn: aDocument.
	self writePreambleOn: aDocument
]

{ #category : #writing }
WAXmlRoot >> writePreambleOn: aDocument [
	aDocument nextPutAll: '<?xml version="1.0" encoding="'; nextPutAll: self charSet; nextPutAll: '"?>'
]
