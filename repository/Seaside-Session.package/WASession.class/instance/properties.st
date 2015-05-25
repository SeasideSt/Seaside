accessing
properties
	"Answer a dictionary of session-related properties."
	^ properties ifNil: [ properties := GRSmallDictionary new ]