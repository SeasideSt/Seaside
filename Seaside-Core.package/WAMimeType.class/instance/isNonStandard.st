testing
isNonStandard
	"tests if the receiver is a non-standard mime type that is not registered with IANA"
	^ (self main beginsWithSubCollection: 'x-')
		or: [ (self main beginsWithSubCollection: 'X-')
		or: [ (self sub beginsWithSubCollection: 'x-')
		or: [ self sub beginsWithSubCollection: 'X-' ] ] ]