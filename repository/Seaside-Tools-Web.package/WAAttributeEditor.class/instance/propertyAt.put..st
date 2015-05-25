accessing
propertyAt: aSymbol put: anObject

	properties at: aSymbol put: anObject.
	group isNil ifFalse: [ self class updatePropertiesCacheFor: self ]