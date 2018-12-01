Class {
	#name : #SUCounterTest,
	#superclass : #SUFunctionalTest,
	#instVars : [
		'count'
	],
	#category : 'Scriptaculous-Tests-Core-Functional'
}

{ #category : #'instance creation' }
SUCounterTest class >> new [
	^ self on: 0
]

{ #category : #'instance creation' }
SUCounterTest class >> on: anInteger [
	^ self basicNew initializeOn: anInteger; yourself
]

{ #category : #actions }
SUCounterTest >> decrease [
	count := count - 1
]

{ #category : #actions }
SUCounterTest >> increase [
	count := count + 1
]

{ #category : #initialization }
SUCounterTest >> initializeOn: anInteger [
	self initialize.
	count := anInteger
]

{ #category : #rendering }
SUCounterTest >> renderContentOn: html [
	| id |
	html paragraph: [
		html span
			id: (id := html nextId);
			with: count.
		html space.
		html anchor
			onClick: (html scriptaculous updater
				id: id;
				callback: [ :render | self increase; renderCountOn: render ]);
			with: '++'.
		html space.
		html anchor
			onClick: (html scriptaculous updater
				id: id;
				callback: [ :render | self decrease; renderCountOn: render ]);
			with: '--' ]
]

{ #category : #rendering }
SUCounterTest >> renderCountOn: html [
	html render: count
]
