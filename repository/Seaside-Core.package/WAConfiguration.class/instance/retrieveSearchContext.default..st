attributes-private
retrieveSearchContext: aSymbol default: defaultValue
	"Answer the cached search context. If none found, the defaultValue is returned."
	^ cachedSearchContexts at: aSymbol ifAbsent: [ defaultValue ]