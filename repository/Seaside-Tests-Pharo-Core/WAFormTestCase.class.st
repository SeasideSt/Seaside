Class {
	#name : #WAFormTestCase,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Pharo-Core'
}

{ #category : #testing }
WAFormTestCase class >> isAbstract [
	^ self name = #WAFormTestCase
]

{ #category : #private }
WAFormTestCase >> formClassExists [
	^ Smalltalk hasClassNamed: #Form
]

{ #category : #private }
WAFormTestCase >> sampleForm [
	^ (Smalltalk classNamed: #Form)
		extent: 16@16
		depth: 1
		fromArray: #( 0 0 0 50331648 25165824 12582912 281018368 415236096 264241152 132120576 7340032 3670016 1572864 0 0 0)
		offset: 0@0
]
