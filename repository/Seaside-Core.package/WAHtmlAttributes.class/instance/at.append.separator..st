accessing
at: aKey append: aValue separator: aSeparator 
	"Append aValue to the attribute aKey. If already present, concatenate it with aString. Ignore the request if aValue is nil.
	https://code.google.com/p/seaside/issues/detail?id=816
	we have to be frugal with allocation"
	
	aValue isNil ifFalse: [
		| current |
		current := self at: aKey ifAbsentPut: [ aValue ].
		current ~~ aValue ifTrue: [
			"we couldn't store a value because there was already one"
			current isConcatenatedHtmlAttributeValue
				ifTrue: [ current addValue: aValue ]
				ifFalse: [ self at: aKey put: (WAConcatenatedHtmlAttributeValue separator: aSeparator value: current value: aValue) ] ] ]