Class {
	#name : 'WAHotwireTurboEditableCounterTestComponent',
	#superclass : 'WAComponent',
	#instVars : [
		'count'
	],
	#category : 'Seaside-Tests-HotwireTurbo',
	#package : 'Seaside-Tests-HotwireTurbo'
}

{ #category : 'instance creation' }
WAHotwireTurboEditableCounterTestComponent class >> newWith: aNumber [

	^ self new counter: aNumber
]

{ #category : 'initialization' }
WAHotwireTurboEditableCounterTestComponent >> counter: aNumber [
	
	count := aNumber
]

{ #category : 'initialization' }
WAHotwireTurboEditableCounterTestComponent >> initialize [
	
	super initialize.
	count := 0
]

{ #category : 'rendering' }
WAHotwireTurboEditableCounterTestComponent >> renderContentOn: html [

	html heading 
		level: 1; 
		with: count.
	html anchor
		callback: [ count := count + 1 ];
		with: '++'.
	html space.
	html anchor
		callback: [ count := count - 1 ];
		with: '--'.
	html space.
	html anchor
		callback: [ self answer: count ];
		with: 'Close'
]
