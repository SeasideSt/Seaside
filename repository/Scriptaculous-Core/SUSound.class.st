Class {
	#name : #SUSound,
	#superclass : #PTNamed,
	#category : 'Scriptaculous-Core'
}

{ #category : #private }
SUSound >> defaultMethod [
	^ 'play'
]

{ #category : #private }
SUSound >> defaultPrototype [
	^ 'Sound'
]

{ #category : #actions }
SUSound >> disable [
	self method: 'disable'
]

{ #category : #actions }
SUSound >> enable [
	self method: 'enable'
]

{ #category : #actions }
SUSound >> play [
	self method: 'play'
]

{ #category : #actions }
SUSound >> play: aUrl [
	self url: aUrl; play
]

{ #category : #options }
SUSound >> replace: aBoolean [
	self optionAt: 'replace' put: aBoolean
]

{ #category : #options }
SUSound >> track: aString [
	self optionAt: 'track' put: aString
]

{ #category : #accessing }
SUSound >> url [
	^ id
]

{ #category : #accessing }
SUSound >> url: aUrl [
	id := aUrl
]
