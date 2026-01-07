Class {
	#name : 'WAHotwireTurboCounterTestComponent',
	#superclass : 'WAComponent',
	#instVars : [
		'counter'
	],
	#category : 'Seaside-Tests-HotwireTurbo',
	#package : 'Seaside-Tests-HotwireTurbo'
}

{ #category : 'instance creation' }
WAHotwireTurboCounterTestComponent class >> newWithValue: anInteger [

	^ self new counter: anInteger
]

{ #category : 'accessing' }
WAHotwireTurboCounterTestComponent >> counter [

	^ counter
]

{ #category : 'accessing' }
WAHotwireTurboCounterTestComponent >> counter: anInteger [

	counter := anInteger
]

{ #category : 'initialization' }
WAHotwireTurboCounterTestComponent >> initialize [

	super initialize.
	counter := 0
]

{ #category : 'rendering' }
WAHotwireTurboCounterTestComponent >> renderContentOn: html [

	html heading
		level: 1;
		with: counter.
	html anchor
		callback: [ self turboShow: (WAHotwireTurboEditableCounterTestComponent newWith: counter) onAnswer: [ :value | counter := value ] ];
		with: 'Edit'
]

{ #category : 'rendering' }
WAHotwireTurboCounterTestComponent >> renderLazyTurboFrameContentsOn: html [

	html text: 'Lazy counter'
]
