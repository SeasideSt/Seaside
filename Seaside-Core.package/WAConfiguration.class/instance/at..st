values
at: aSymbol
	"Retrieves the value of a configuration according to a symbol.
	Checks if the search context resides in the cache, and if not searches for the value according to the configurations ancestry."
	| value context |
	context := self getSearchContextFor: aSymbol.
	
	value := self valueForContext: context.
	
	^ value isNil
		ifTrue: [ context attribute default ]
		ifFalse: [ value ]