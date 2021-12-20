initialization
destroy
	"Destroy the receiver"

	super destroy.
	bufferedStream := nil.
	externalStream := nil