tests-conveniance
testBasicAuthentication
	self response basicAuthenticationRealm: 'seaside'.
	self assertLines: #('HTTP/1.1 401 Unauthorized' 'WWW-Authenticate: Basic realm="seaside"' 'Content-Length: 0' '')