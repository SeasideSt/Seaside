private
formatString: aString

	| result replacements |
	
	replacements := OrderedCollection new.
	replacements add: '\' -> '\\'.
	replacements add: String lf -> '\r'.
	replacements add: String tab -> '\t'.
	replacements add: '"' -> '\"'.
	
	result := aString.
	replacements do: [ :each | 
		result := result copyReplaceAll: each key with: each value ].
	^ result