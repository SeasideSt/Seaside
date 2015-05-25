I am a server independent http request object. Instance of me can be aquired through WAObject >> #currentRequest.

Instance Variables
	method:			<String>
	uri:					<WAUrl>
	version:				<WAHttpVersion>
	remoteAddress:	<String>
	headers:			<Dictionary<String, String>>
	cookies:			<Collection<WARequestCookie>>
	body:				<String>
	postFields:			<WARequestFields>
	sslSessionId:		<String>
			
method
	- the HTTP method, should be upper case. In general only 'GET' and 'POST' are encountered in Seaside. SqueakSource also supports 'PUT'.		

uri
	- The request url without parameters. For example if the client requested 'http://www.google.com/search?q=seaside' then the contents of url would be '/search'. To get the parameters use #fields. This url is fully decoded. Use the #host method to get the host name. Dependening on the server adapter the #scheme may be 'http' or 'https' if the original request was HTTPS.
	
version
	- The version of this request.
	
remoteAddress
	- The IP address of the client. If the server is behind a reverse proxy then this is '127.0.0.1'. This could in theory also be an IPv6 address.

headers
	- The header of the HTTP request. This is a Dictionary mapping lowercase strings to other strings.
	
cookies
	- The collection of cookies (instance of WARequestCookie) the client sent. Note not all clients support all fields. E.g. you might send a path but the client might not return it. Note there can be several cookies with the same key but a different domain or path. See the #cookiesAt: method.
	
body
	- The undecoded, raw request body as a String, may be nil. See the "accessing-body" protocol for accessing it.
	
postFields
	- The HTTP POST request parameters. In general this is a dictionary mapping Strings to Strings. In the case of multivalued paramters multiple mappings may exist.
	
sslSessionId
	- The SSL session id. This is an opaque string. It is not present if the request wasn't made over SSL (or TLS) or the server adaptor does not support this feature.