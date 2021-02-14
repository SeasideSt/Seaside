"
Load a remote page using an HTTP GET request.
"
Class {
	#name : #JQGet,
	#superclass : #JQAjax,
	#category : 'JQuery-Core-Objects'
}

{ #category : #accessing }
JQGet >> arguments [
	| arguments |
	arguments := OrderedCollection with: self url.
	self options
		at: 'data'
		ifPresent: [ :value | arguments add: value ].
	self options
		at: 'success'
		ifPresent: [ :value | arguments add: value ].
	self options
		at: 'dataType'
		ifPresent: [ :value | arguments add: value ].
	^ arguments
]

{ #category : #options }
JQGet >> isSupportedOption: aString [
	^ #('url' 'data' 'success' 'dataType') includes: aString
]

{ #category : #accessing }
JQGet >> method [
	^ 'get'
]
