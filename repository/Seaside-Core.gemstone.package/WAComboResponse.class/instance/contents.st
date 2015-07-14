accessing
contents
	"Answer the contents of the response. If the response is streaming, answer nil"

	^ committed ifFalse: [ bufferedStream contents ]