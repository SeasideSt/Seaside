Class {
	#name : 'WATurboCounter',
	#superclass : 'WAComponent',
	#instVars : [
		'counter'
	],
	#category : 'Seaside-HotwireTurbo-Examples',
	#package : 'Seaside-HotwireTurbo-Examples'
}

{ #category : 'accessing' }
WATurboCounter >> counter [

	^ counter
]

{ #category : 'accessing' }
WATurboCounter >> counter: aValue [
	
	counter := aValue
]

{ #category : 'actions' }
WATurboCounter >> decrease [

	counter := counter - 1
]

{ #category : 'actions' }
WATurboCounter >> increase [

	counter := counter + 1
]

{ #category : 'initialization' }
WATurboCounter >> initialize [

	super initialize.
	counter := 0
]

{ #category : 'rendering' }
WATurboCounter >> renderContentOn: html [

	html heading: counter.
	html anchor
		callback: [ self increase ];
		with: '++'.
	html space.
	html anchor
		callback: [ self decrease ];
		with: '--'
]
