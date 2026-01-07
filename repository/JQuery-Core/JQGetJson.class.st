"
Load JSON data using an HTTP GET request.
"
Class {
	#name : 'JQGetJson',
	#superclass : 'JQAjax',
	#category : 'JQuery-Core-Objects',
	#package : 'JQuery-Core',
	#tag : 'Objects'
}

{ #category : 'accessing' }
JQGetJson >> argumentsDo: aBlock [
	aBlock value: self url.
	self options
		at: 'data'
		ifPresent: [ :data | aBlock value: data ].
	self options
		at: 'success'
		ifPresent: [ :success | aBlock value: success ]
]

{ #category : 'options' }
JQGetJson >> isSupportedOption: aString [
	^ #('url' 'data' 'success' "(" 'dataType' ")") includes: aString
]

{ #category : 'accessing' }
JQGetJson >> method [
	^ 'getJSON'
]
