Class {
	#name : #JSMember,
	#superclass : #JSDecoration,
	#instVars : [
		'name'
	],
	#category : 'Javascript-Core-Decorations'
}

{ #category : #'instance creation' }
JSMember class >> named: anObject [
	^ self new name: anObject
]

{ #category : #accessing }
JSMember >> name [
	^ name
]

{ #category : #accessing }
JSMember >> name: aString [
	name := aString
]
