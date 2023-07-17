tests - test data
translationLiteralsArrayAsCompiledMethod

	^ {
		  ('Select a locale below' -> (Set newFrom: { (WAGettextExample >> #renderLocaleSelectionOn:) })).
		  ('fontsize' -> (Set newFrom: { (WAGettextExample >> #renderContentOn:) })).
		  ('locale' -> (Set newFrom: { (WAGettextExample >> #renderLocaleSelectionOn:) })) }