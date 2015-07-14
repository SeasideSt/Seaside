attributes-private
getSearchContextFor: aSymbol ifAbsent: aBlock
	"Returns a search context for the given symbol."
	| context |
	
	context := self
		retrieveSearchContext: aSymbol
		ifAbsentPut: [
			WAAttributeSearchContext key: aSymbol target: self ].
	context attribute isNil ifTrue: [ aBlock value ].
	^ context