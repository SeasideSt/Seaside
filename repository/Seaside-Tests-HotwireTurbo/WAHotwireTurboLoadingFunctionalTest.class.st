Class {
	#name : 'WAHotwireTurboLoadingFunctionalTest',
	#superclass : 'WAHotwiredFunctionalTest',
	#instVars : [
		'components'
	],
	#category : 'Seaside-Tests-HotwireTurbo',
	#package : 'Seaside-Tests-HotwireTurbo'
}

{ #category : 'hooks' }
WAHotwireTurboLoadingFunctionalTest >> children [

	^ components
]

{ #category : 'initialization' }
WAHotwireTurboLoadingFunctionalTest >> initialize [

	super initialize.
	components := OrderedCollection new.
	1 to: 100 do:[:i | 
		components add: ((WAHotwireTurboCounterTestComponent newWithValue: i) addDecoration: WATurboFrame new loadLazy; yourself) ].
]

{ #category : 'rendering' }
WAHotwireTurboLoadingFunctionalTest >> renderContentOn: html [

	html unorderedList: [
		components do: [:component | html listItem: component ] ]
]
