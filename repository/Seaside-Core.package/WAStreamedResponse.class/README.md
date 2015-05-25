A WAStreamedResponse is a HTTP response that directly writes to an external write stream. This response class is used to implement efficient HTTP response streaming, as it can directly write do the socket while content is still generated.

Instance Variables
	committed:		<Boolean>	Whether the status and header was written to the stream.
	externalStream:		<WriteStream>	The external stream to write to.