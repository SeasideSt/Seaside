I represent all portions of an URL as described by the RFC 1738 and updated by RFC 3986. I include scheme, userinfo, host, port, path, query, and fragment.

Instance Variables
	scheme:			<String> or nil
	user:		<String> or nil
	password:		<String> or nil
	host:		<String> or nil
	port:			<Integer> or nil
	path:			<OrderedCollection> or nil
	slash:			<Boolean>
	queryFields:		<WARequestFields> or nil
	fragment:		<String> or nil
	pathParameters:		<GROrderedMultiMap> or nil