tests
testScheme
	url
		scheme: 'https';
		host: 'seaside.st'.
	self assert: url scheme = 'https'.
	self assert: url greaseString = 'https://seaside.st/'.
	"Tests from Boris"
	url host: 'seaside.st'.
	url
		port: 80;
		scheme: 'http'.
	self assert: url greaseString = 'http://seaside.st/'.
	url
		port: 443;
		scheme: 'https'.
	self assert: url greaseString = 'https://seaside.st/'.
	url
		port: 80;
		scheme: #http.
	self assert: url greaseString = 'http://seaside.st/'.
	url
		port: 443;
		scheme: #https.
	self assert: url greaseString = 'https://seaside.st/'