accessing
properties
	"Answer a dictionary of request-related properties."
	^ properties ifNil: [ properties := GRSmallDictionary2 new ]