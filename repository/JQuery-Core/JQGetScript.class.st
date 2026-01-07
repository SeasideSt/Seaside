"
Loads, and executes, a local JavaScript file using an HTTP GET request.
"
Class {
	#name : 'JQGetScript',
	#superclass : 'JQAjax',
	#category : 'JQuery-Core-Objects',
	#package : 'JQuery-Core',
	#tag : 'Objects'
}

{ #category : 'accessing' }
JQGetScript >> argumentsDo: aBlock [
	aBlock value: self javascriptUrl.
	self options
		at: 'success'
		ifPresent: [ :success | aBlock value: success ]
]

{ #category : 'options' }
JQGetScript >> isSupportedOption: aString [
	^ #('url' 'success' "(" 'dataType' ")") includes: aString
]

{ #category : 'accessing' }
JQGetScript >> method [
	^ 'getScript'
]
