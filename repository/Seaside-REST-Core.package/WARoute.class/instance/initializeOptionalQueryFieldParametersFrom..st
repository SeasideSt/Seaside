initialization
initializeOptionalQueryFieldParametersFrom: aString

	optionalQueryParameters := OrderedCollection new.
	aString splitOn: $, do: [ :s | optionalQueryParameters add: s ] 