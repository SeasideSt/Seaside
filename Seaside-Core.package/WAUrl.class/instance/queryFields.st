accessing
queryFields
	"Answer a dictionary with the query fields."
	^ queryFields ifNil: [ queryFields := WARequestFields new ]