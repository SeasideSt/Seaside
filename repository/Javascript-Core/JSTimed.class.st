Class {
	#name : #JSTimed,
	#superclass : #JSDecoration,
	#instVars : [
		'duration'
	],
	#category : 'Javascript-Core-Decorations'
}

{ #category : #'instance creation' }
JSTimed class >> duration: aDuration [
	^ self new duration: aDuration
]

{ #category : #accessing }
JSTimed >> duration [
	^ duration
]

{ #category : #accessing }
JSTimed >> duration: aDuration [
	duration := aDuration
]
