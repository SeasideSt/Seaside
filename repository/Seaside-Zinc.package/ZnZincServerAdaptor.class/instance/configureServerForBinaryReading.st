initialize-release
configureServerForBinaryReading
	"Seaside wants to do its own text conversions"

	server reader: (server streamUploads
		ifTrue: [
			[ :stream | ZnRequest readBinaryFrom: stream ] ]
		ifFalse: [ 
			[ :stream | ZnRequest readStreamingFrom: stream ] ])