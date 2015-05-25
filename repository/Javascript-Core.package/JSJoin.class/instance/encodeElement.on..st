encoding
encodeElement: anObject on: aDocument
	"We assume that the element is already URL encoded if this is not an association."

	(anObject isKindOf: Association)
		ifTrue: [
			aDocument nextPut: $".
			aDocument urlEncoder
				nextPutAll: anObject key greaseString.
			anObject value isNil 
				ifTrue: [ aDocument nextPut: $" ]
				ifFalse: [
					aDocument nextPut: $=.
					(anObject value isString or: [ anObject value isCharacter ])
						ifTrue: [
							aDocument urlEncoder 
								nextPutAll: anObject value greaseString.
							aDocument nextPut: $" ]
						ifFalse: [
							aDocument nextPutAll: '"+encodeURIComponent('.
							aDocument stream javascript: anObject value.
							aDocument nextPut: $) ] ] ]
		ifFalse: [ aDocument stream javascript: anObject ]