Class {
	#name : 'WAHotwireTurboFunctionalTest',
	#superclass : 'WAHotwiredFunctionalTest',
	#instVars : [
		'comp1',
		'comp2'
	],
	#category : 'Seaside-Tests-HotwireTurbo',
	#package : 'Seaside-Tests-HotwireTurbo'
}

{ #category : 'hooks' }
WAHotwireTurboFunctionalTest >> children [

	^ { comp1 . comp2 }
]

{ #category : 'initialization' }
WAHotwireTurboFunctionalTest >> initialize [

	super initialize.
	comp1 := WAHotwireTurboCounterTestComponent new addDecoration: WATurboFrame new; yourself.
	comp2 := WAHotwireTurboCounterTestComponent new addDecoration: WATurboFrame new; yourself.
]

{ #category : 'rendering' }
WAHotwireTurboFunctionalTest >> renderContentOn: html [

	html paragraph: 'Both counters are wrapped as turbo frames. Clicking on an action (++ or --) in either one of the counters should only update the counter itself. The rest of the page should not have been updated.'.

	html render: comp1.
	html render: comp2
]
