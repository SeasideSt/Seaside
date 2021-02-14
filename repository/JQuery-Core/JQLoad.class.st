"
Load HTML from a remote file and inject it into the DOM.
"
Class {
	#name : #JQLoad,
	#superclass : #JQAjax,
	#instVars : [
		'selector'
	],
	#category : 'JQuery-Core-Objects'
}

{ #category : #accessing }
JQLoad >> arguments [
	| arguments |
	arguments := OrderedCollection with: self selectorUrl.
	self options
		at: 'data'
		ifPresent: [ :value | arguments add: value ].
	self options
		at: 'complete'
		ifPresent: [ :value | arguments add: value ].
	^ arguments
]

{ #category : #options }
JQLoad >> isSupportedOption: aString [
	^ #('url' 'data' 'complete' "(" 'dataType' ")") includes: aString
]

{ #category : #accessing }
JQLoad >> method [
	^ 'load'
]

{ #category : #options }
JQLoad >> selector: aString [
	"An additional selector filters the incoming HTML document, only injecting the elements that match the selector."
	
	selector := aString
]

{ #category : #'accessing-urls' }
JQLoad >> selectorUrl [
	^ selector isNil 
		ifTrue: [ self url ]
		ifFalse: [ self url greaseString , ' ' , selector greaseString ]
]
