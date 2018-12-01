Class {
	#name : #WATrailFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'component',
		'trail'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #hooks }
WATrailFunctionalTest >> children [
	^ Array with: trail with: component
]

{ #category : #initialization }
WATrailFunctionalTest >> initialize [
	super initialize.
	component := WATrailTestComponent new.
	trail := WATrail on: component
]

{ #category : #rendering }
WATrailFunctionalTest >> renderContentOn: html [
	html render: trail.
	html div: component
]
