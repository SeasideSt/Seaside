"
A WACounter is component that displays a number. Additionally it has two links that allow the user to increase or decrease this number by 1. 

The lesson to learn here is how the Seaside callback mechanism is used, how anchors can be used to trigger actions.

Instance Variables
	count:		<Integer>

count
	- the number to display, default 0

"
Class {
	#name : #WACounter,
	#superclass : #WAExampleComponent,
	#instVars : [
		'count'
	],
	#category : 'Seaside-Examples-Misc'
}

{ #category : #accessing }
WACounter class >> description [
	^ 'A very simple Seaside application'
]

{ #category : #examples }
WACounter class >> exampleComponent [
	^ self new
]

{ #category : #accessing }
WACounter class >> handlerName [
	^ 'examples/counter'
]

{ #category : #initialization }
WACounter class >> initialize [
	WAAdmin register: self asApplicationAt: self handlerName
]

{ #category : #accessing }
WACounter >> count [
	^ count
]

{ #category : #accessing }
WACounter >> count: anInteger [
	count := anInteger
]

{ #category : #actions }
WACounter >> decrease [
	count := count - 1
]

{ #category : #actions }
WACounter >> increase [
	count := count + 1
]

{ #category : #initialization }
WACounter >> initialize [
	super initialize.
	self count: 0
]

{ #category : #rendering }
WACounter >> renderContentOn: html [
	html heading: count.
	html anchor
		callback: [ self increase ];
		with: '++'.
	html space.
	html anchor
		callback: [ self decrease ];
		with: '--'
]

{ #category : #hooks }
WACounter >> states [
	^ Array with: self
]
