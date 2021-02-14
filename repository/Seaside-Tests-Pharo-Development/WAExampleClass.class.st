Class {
	#name : #WAExampleClass,
	#superclass : #GRObject,
	#type : #variable,
	#instVars : [
		'first',
		'second'
	],
	#category : 'Seaside-Tests-Pharo-Development'
}

{ #category : #accessing }
WAExampleClass >> first [
	^ first
]

{ #category : #accessing }
WAExampleClass >> first: anObject [
	first := anObject
]

{ #category : #accessing }
WAExampleClass >> second [
	^ second
]

{ #category : #accessing }
WAExampleClass >> second: anObject [
	second := anObject
]
