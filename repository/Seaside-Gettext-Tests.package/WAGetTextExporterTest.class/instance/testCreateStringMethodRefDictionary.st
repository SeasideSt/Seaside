tests
testCreateStringMethodRefDictionary

	| methodRefStringAssociations exporter expectedDictionary result |
	methodRefStringAssociations := { WAGettextExample>>#renderContentOn:->#('fontsize' 'fontsize'). WAGettextExample>>#renderLocaleSelectionOn:->#('Select a locale below' 'locale' 'Select a locale below' 'locale'). WAGettextExample>>#renderLocaleSelectionOn:->#('Select a locale below' 'locale' 'Select a locale below' 'locale'). WAGettextExample>>#renderContentOn:->#('fontsize' 'fontsize'). WAGettextExample>>#renderLocaleSelectionOn:->#('Select a locale below' 'locale' 'Select a locale below' 'locale'). WAGettextExample>>#renderLocaleSelectionOn:->#('Select a locale below' 'locale' 'Select a locale below' 'locale') }.
	
	expectedDictionary := self translationLiteralsDict.
	exporter := WAGetTextExporter new.
	result := exporter createStringMethodRefDictionary: methodRefStringAssociations.
	self assert: result equals: expectedDictionary.