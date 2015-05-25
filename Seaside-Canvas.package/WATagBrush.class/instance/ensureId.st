public
ensureId
	"Answer the id of the receiving attribute. In case the receiver doesn't have an id yet, generate a new one."

	^ self attributes at: 'id' ifAbsentPut: [ canvas nextId ]