"
Load JSON data using an HTTP GET request.
"
Class {
	#name : #JQGetJson,
	#superclass : #JQAjax,
	#category : 'JQuery-Core-Objects'
}

{ #category : #accessing }
JQGetJson >> arguments [
	| arguments |
	arguments := OrderedCollection with: self url.
	self options
		at: 'data'
		ifPresent: [ :value | arguments add: value ].
	self options
		at: 'success'
		ifPresent: [ :value | arguments add: value ].
	^ arguments
]

{ #category : #options }
JQGetJson >> isSupportedOption: aString [
	^ #('url' 'data' 'success' "(" 'dataType' ")") includes: aString
]

{ #category : #accessing }
JQGetJson >> method [
	^ 'getJSON'
]
