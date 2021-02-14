Class {
	#name : #WAExpirySession,
	#superclass : #WASession,
	#classVars : [
		'Created',
		'Unregistered'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #accessing }
WAExpirySession class >> created [
	^ Created
]

{ #category : #'class initialization' }
WAExpirySession class >> initialize [
	self resetCounters
]

{ #category : #actions }
WAExpirySession class >> resetCounters [
	Unregistered := 0.
	Created := 0
]

{ #category : #accessing }
WAExpirySession class >> unregistered [
	^ Unregistered
]

{ #category : #initialization }
WAExpirySession >> initialize [
	super initialize.
	Created := Created + 1
]

{ #category : #'parent/child' }
WAExpirySession >> unregistered [
	super unregistered.
	Unregistered := Unregistered + 1
]
