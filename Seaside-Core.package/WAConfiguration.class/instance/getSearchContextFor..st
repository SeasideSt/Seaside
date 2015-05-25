attributes-private
getSearchContextFor: aSymbol
	"Returns a search context for the given symbol."
	^ self getSearchContextFor: aSymbol ifAbsent: [ WAAttributeNotFound signalWithKey: aSymbol ]