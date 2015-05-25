I provide an adapter between Seaside and the Comanche web server. To start a new server on port 8080, evaluate

	WAComancheAdaptor startOn: 8080.
	
and to stop it, evaluate

	WAComancheAdaptor stop.

By default I don't do any input conversion at all, you will get the input in whatever encoding the client sent and are expected to deliver it in the same. Howerver this behavior can be changed by evaluating
WAComancheAdaptor default encoding: anEncoding
See the class comment of the superclass for a discussion on this topic.