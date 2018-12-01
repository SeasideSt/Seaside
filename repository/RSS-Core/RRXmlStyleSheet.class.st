Class {
	#name : #RRXmlStyleSheet,
	#superclass : #WAContentElement,
	#category : 'RSS-Core'
}

{ #category : #attributes }
RRXmlStyleSheet >> beCss [
	self type: WAMimeType textCss
]

{ #category : #attributes }
RRXmlStyleSheet >> beXsl [
	self type: 'text/xsl' seasideMimeType
]

{ #category : #printing }
RRXmlStyleSheet >> encodeOn: aDocument [
	aDocument nextPutAll: '<?xml-stylesheet'.
	
	attributes encodeOn: aDocument.
	self childrenDo: [ :each | each encodeOn: aDocument ].
	
	aDocument nextPutAll: '?>'
]

{ #category : #accessing }
RRXmlStyleSheet >> tag [
	self shouldNotImplement
]

{ #category : #attributes }
RRXmlStyleSheet >> url: aString [
	self attributeAt: 'href' put: aString
]
