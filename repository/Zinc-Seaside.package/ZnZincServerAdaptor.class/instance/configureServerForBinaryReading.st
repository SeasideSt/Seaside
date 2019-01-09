initialize-release
configureServerForBinaryReading
	"Seaside wants to do its own text conversions"

	server reader: [ :stream | ZnRequest readBinaryFrom: stream ]