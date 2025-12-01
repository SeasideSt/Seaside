"
Load a remote page using an HTTP POST request.
"
Class {
	#name : 'JQPost',
	#superclass : 'JQAjax',
	#category : 'JQuery-Core-Objects',
	#package : 'JQuery-Core',
	#tag : 'Objects'
}

{ #category : 'accessing' }
JQPost >> argumentsDo: aBlock [
	aBlock value: self url.
	self options
		at: 'data'
		ifPresent: [ :data | aBlock value: data ].
	self options
		at: 'success'
		ifPresent: [ :success | aBlock value: success ].
	self options
		at: 'dataType'
		ifPresent: [ :dataType | aBlock value: dataType ]
]

{ #category : 'options' }
JQPost >> isSupportedOption: aString [
	^ #('url' 'data' 'success' 'dataType') includes: aString
]

{ #category : 'accessing' }
JQPost >> method [
	^ 'post'
]
