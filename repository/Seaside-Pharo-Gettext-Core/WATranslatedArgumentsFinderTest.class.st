"
A WATranslatedArgumentsFinderTest is a test class for testing the behavior of WATranslatedArgumentsFinder
"
Class {
	#name : 'WATranslatedArgumentsFinderTest',
	#superclass : 'TestCase',
	#category : 'Seaside-Pharo-Gettext-Core-Tests',
	#package : 'Seaside-Pharo-Gettext-Core',
	#tag : 'Tests'
}

{ #category : 'test' }
WATranslatedArgumentsFinderTest >> testTranslatedArguments [

	| translatedArguments expectedArguments expectedArgumentsDict |
	translatedArguments := (WATranslatedArgumentsFinder new translatedArguments: { WAGettextExample }).
	expectedArguments := ({
		((WAGettextExample>>#renderContentOn:) asRingDefinition)->#('fontsize').
		((WAGettextExample>>#renderLocaleSelectionOn:) asRingDefinition)->#('Select a locale below' 'locale').
		((WAGettextExample>>#renderLocaleSelectionOn:) asRingDefinition)->#('Select a locale below' 'locale'). "Note: this test is not testing value overwrites"
	}).
	expectedArgumentsDict := Dictionary new.
	expectedArguments do: [ :el | expectedArgumentsDict at: (el key) put: (el value) ].
	
	translatedArguments do: [ :el |
		expectedArgumentsDict at: (el key) 
			ifPresent:[ :val | self assert: (el value) equals: val ] 
			ifAbsent: [ AssertionFailure signal: 'actual key does not equal expected key' ] 
		].
]
