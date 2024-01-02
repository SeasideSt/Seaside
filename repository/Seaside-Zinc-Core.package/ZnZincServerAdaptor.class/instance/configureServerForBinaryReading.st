initialization
configureServerForBinaryReading
	"Seaside wants to do its own text conversions"

	server reader: (server streamUploads
			 ifTrue: [ [ :stream | ZnRequest readStreamingFrom: stream ] ]
			 ifFalse: [ [ :stream | ZnRequest readBinaryFrom: stream ] ])