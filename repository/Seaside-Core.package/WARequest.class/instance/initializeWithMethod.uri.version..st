initialization
initializeWithMethod: methodString uri: aUrlOrString version: aVersion
	self initialize.
	method := methodString asUppercase.
	uri := aUrlOrString seasideUrl.
	version := aVersion.
	headers := WAHeaderFields new.
	postFields := WARequestFields new.
	cookies := OrderedCollection new.
	remoteAddress := nil