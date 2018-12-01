"
Load a remote page using an HTTP POST request.
"
Class {
	#name : #JQPost,
	#superclass : #JQAjax,
	#category : 'JQuery-Core-Objects'
}

{ #category : #accessing }
JQPost >> arguments [
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
JQPost >> isSupportedOption: aString [
	^ #('url' 'data' 'success' 'dataType') includes: aString
]

{ #category : #accessing }
JQPost >> method [
	^ 'post'
]
