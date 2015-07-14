I represent all portions of an URL as described by the RFC 1738 and updated by RFC 3986. I include scheme, userinfo, host, port, path, parameter, query, and fragment.

Instance Variables
	scheme:			<String> or nil
	user:				<String> or nil
	password:			<String> or nil
	host:				<String> or nil
	port:				<Integer> or nil
	path:				<OrderedCollection> or nil
	slash:				<Boolean>
	queryFields:		<WARequestFields> or nil
	fragment:			<String> or nil
	pathParameters:	<GROrderedMultiMap> or nil
		
A Primer on URL encoding:
http://blog.lunatech.com/2009/02/03/what-every-web-developer-must-know-about-url-encoding
		
Path Parameters:
http://doriantaylor.com/policy/http-url-path-parameter-syntax
you can have multiple name without values
/path/name;param1;p2;p3
or names with multiple values
;param=val1,val2,val3