"
Load a remote page using an HTTP GET request.
"
Class {
	#name : 'JQGet',
	#superclass : 'JQAjax',
	#category : 'JQuery-Core-Objects',
	#package : 'JQuery-Core',
	#tag : 'Objects'
}

{ #category : 'accessing' }
JQGet >> argumentsDo: aBlock [
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
JQGet >> isSupportedOption: aString [
	^ #('url' 'data' 'success' 'dataType') includes: aString
]

{ #category : 'accessing' }
JQGet >> method [
	^ 'get'
]
