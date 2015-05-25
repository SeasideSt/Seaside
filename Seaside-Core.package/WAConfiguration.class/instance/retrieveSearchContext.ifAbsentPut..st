attributes-private
retrieveSearchContext: aSymbol ifAbsentPut: aBlock
	"Answers a search context. If the context resides in the cache, the value from the cache is returned. If not, a new cache entry is created using aBlock."
	| context |
	cachedSearchContexts isNil ifTrue: [
		cachedSearchContexts := IdentityDictionary new ].
	context := cachedSearchContexts at: aSymbol ifAbsentPut: aBlock.
	^ context attribute isNil
		ifTrue: [ cachedSearchContexts at: aSymbol put: aBlock value ]
		ifFalse: [ context ]