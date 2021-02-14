"
Loads, and executes, a local JavaScript file using an HTTP GET request.
"
Class {
	#name : #JQGetScript,
	#superclass : #JQAjax,
	#category : 'JQuery-Core-Objects'
}

{ #category : #accessing }
JQGetScript >> arguments [
	| arguments |
	arguments := OrderedCollection with: self javascriptUrl.
	self options
		at: 'success'
		ifPresent: [ :value | arguments add: value ].
	^ arguments
]

{ #category : #options }
JQGetScript >> isSupportedOption: aString [
	^ #('url' 'success' "(" 'dataType' ")") includes: aString
]

{ #category : #accessing }
JQGetScript >> method [
	^ 'getScript'
]
