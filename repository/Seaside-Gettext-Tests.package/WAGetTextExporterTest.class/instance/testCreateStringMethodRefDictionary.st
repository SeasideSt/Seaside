tests
testCreateStringMethodRefDictionary

	| methodRefStringAssociations exporter expectedDictionary result |
	methodRefStringAssociations := { WAGettextExample>>#renderContentOn:->#('fontsize' 'fontsize'). WAGettextExample>>#renderLocaleSelectionOn:->#('Select a locale below' 'locale' 'Select a locale below' 'locale'). WAGettextExample>>#renderLocaleSelectionOn:->#('Select a locale below' 'locale' 'Select a locale below' 'locale'). WAGettextExample>>#renderContentOn:->#('fontsize' 'fontsize'). WAGettextExample>>#renderLocaleSelectionOn:->#('Select a locale below' 'locale' 'Select a locale below' 'locale'). WAGettextExample>>#renderLocaleSelectionOn:->#('Select a locale below' 'locale' 'Select a locale below' 'locale') }.
	
	expectedDictionary := Dictionary newFrom: self translationLiteralsArrayAsCompiledMethod.
	exporter := WAGetTextExporter new.
	result := exporter createStringMethodRefDictionary: methodRefStringAssociations.
	
	self assert: (result at: 'fontsize') size equals: (expectedDictionary at: 'fontsize') size.
	self assert: (result at: 'Select a locale below') size equals: (expectedDictionary at: 'Select a locale below') size.
	self assert: (result at: 'locale') size equals: (expectedDictionary at: 'locale') size.
	
	self assert: result equals: expectedDictionary.
	
	