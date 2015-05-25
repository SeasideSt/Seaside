I am the common superclass for all classes that provided connectivity with the Comanche web server (Kom). Among other thing I do encoding and decoding of requests and responses. I have two main subclasses, WAComancheAdaptor is a traditional server adapter whereas WAListener is a streaming server adapter that proves Comet functionality. When in doubt, pick WAComancheAdaptor.

The encoding can be configured with the #endocing: method. The following values are allowed arguments:
nil
	switches off all encoding
	Strings will be delivered to you in the encoding the client used as ByteStrings. You can configure the encoding of these strings with the #charSet setting of your application. All Strings you return must have this encoding as well.
	
'utf-8'
	uses the utf-8 fast path by Andreas Raab
	Strings will be delivered to you as Squeak encoded Strings (minus the leading char). All the Strings you return must as well be Squeak encoded. Responses send to the client will be utf-8 encoded. You must additionally set the #charSet setting of your application to 'utf-8' (should be the default).
	
any other encoding supported by Squeak, see TextConverter allEncodingNames
	uses whatever TextConverter Squeak uses for this encoding
	Strings will be delivered to you as Squeak encoded Strings (minus the leading character). All the Strings you return must as well be Squeak encoded. Responses send to the client will be in the specified encoding. You must additionally set the #charSet setting of your application to the desired value.