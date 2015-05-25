private
responseForContext: aRequestContext
	| libraryClass consumer |
	consumer := aRequestContext consumer.
	consumer atEnd
		ifTrue: [ ^ (self fileHandlerListingClass on: self context: aRequestContext) responseForLibraries ].
	libraryClass := self 
		libraryAt: consumer next asSymbol
		ifAbsent: [ ^ aRequestContext responseGenerator notFound; respond ].
	consumer atEnd
		ifTrue: [
			| listingClass |
			listingClass := (self fileHandlerListingClass on: self context: aRequestContext).
			listingClass responseForLibrary: libraryClass default ]
		ifFalse: [
			libraryClass handle: aRequestContext.
			" won't be executed if a document is found "
			aRequestContext responseGenerator
				notFound;
				respond ]