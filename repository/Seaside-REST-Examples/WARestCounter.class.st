"
I demonstrate how to use components that put state into URLs so that action can be taken once a session is expired.
"
Class {
	#name : #WARestCounter,
	#superclass : #WAExampleComponent,
	#instVars : [
		'count'
	],
	#category : 'Seaside-REST-Examples'
}

{ #category : #registration }
WARestCounter class >> register [
	(WAAdmin register: WARestCounter asApplicationAt: 'rest-counter')
		addFilter: WARestCounterStarter new
]

{ #category : #accessing }
WARestCounter >> count [
	^ count
]

{ #category : #accessing }
WARestCounter >> count: anInteger [
	count := anInteger
]

{ #category : #actions }
WARestCounter >> decrease [
	count := count - 1
]

{ #category : #actions }
WARestCounter >> increase [
	count := count + 1
]

{ #category : #initialization }
WARestCounter >> initialize [
	super initialize.
	self count: 0
]

{ #category : #rendering }
WARestCounter >> renderContentOn: html [
	html heading: count.
	html anchor
		extraPath: '..';
		extraPath: (self count + 1) greaseString;
		callback: [ self increase ];
		with: '++'.
	html space.
	html anchor
		extraPath: '..';
		extraPath: (self count - 1) greaseString;
		callback: [ self decrease ];
		with: '--'
]

{ #category : #hooks }
WARestCounter >> states [
	^ Array with: self
]

{ #category : #hooks }
WARestCounter >> updateUrl: anUrl [
	super updateUrl: anUrl.
	anUrl addToPath: self count greaseString
]
