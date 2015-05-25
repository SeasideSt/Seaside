comparing
= other
	^ (other isKindOf: WAMimeType)
		and: [ self main = other main
		and: [ self sub = other sub ] ]