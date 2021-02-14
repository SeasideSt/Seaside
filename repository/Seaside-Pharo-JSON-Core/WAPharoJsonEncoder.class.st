"
I am a Pharo specific JSON encoder.
"
Class {
	#name : #WAPharoJsonEncoder,
	#superclass : #WAPharoEncoder,
	#category : 'Seaside-Pharo-JSON-Core'
}

{ #category : #private }
WAPharoJsonEncoder class >> delegateOn: aStream [
	^ WAJsonEncoder on: aStream
]

{ #category : #'class initialization' }
WAPharoJsonEncoder class >> initialize [
	self initializeJsonTable
]

{ #category : #'class initialization' }
WAPharoJsonEncoder class >> initializeJsonTable [
	table := ByteArray new: 256 withAll: 0.
	0 to: 31 do: [ :index | 
		table 
			at: index + 1
			put: 1 ].
	table at: $" greaseInteger + 1 put: 1.
	table at: $\ greaseInteger + 1 put: 1
]
