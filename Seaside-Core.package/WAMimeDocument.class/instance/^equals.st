comparing
= anObject
	^ (anObject isKindOf: WAMimeDocument)
		and: [ self mimeType = anObject mimeType
		and: [ self fileName = anObject fileName
		and: [ self contents = anObject contents ] ] ]