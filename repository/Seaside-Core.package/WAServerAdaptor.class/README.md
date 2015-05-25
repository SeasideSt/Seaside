A WAServer is the abstract base class for all servers. Actual servers do not have to subclass it but have to support the protocol:
 - #codec
 - #usesSmalltalkEncoding

Instance Variables
	codec:		<WACodec>

codec
	- the codec used for response conversion from characters to bytes