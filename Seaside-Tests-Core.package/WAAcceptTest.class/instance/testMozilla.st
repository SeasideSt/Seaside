tests
testMozilla
	| accept accpetLanguage acceptCharset acceptEncoding |
	accept := WAAccept fromString: 'text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5'.
	self assert: accept size = 7.
	self assert: accept at: 1 main: 'text' sub: 'xml' quality: 1.0.
	self assert: accept at: 2 main: 'application' sub: 'xml' quality: 1.0.
	self assert: accept at: 3 main: 'application' sub: 'xhtml+xml' quality: 1.0.
	self assert: accept at: 4 main: 'text' sub: 'html' quality: 0.9.
	self assert: accept at: 5 main: 'text' sub: 'plain' quality: 0.8.
	self assert: accept at: 6 main: 'image' sub: 'png' quality: 1.0.
	self assert: accept at: 7 main: '*' sub: '*' quality: 0.5.
	
	acceptCharset := WAAcceptCharset fromString: 'ISO-8859-1,utf-8;q=0.7,*;q=0.7'.
	self assert: acceptCharset size = 3.
	self assert: acceptCharset at: 1 charset: 'ISO-8859-1' quality: 1.0.
	self assert: acceptCharset at: 2 charset: 'utf-8' quality: 0.7.
	self assert: acceptCharset at: 3 charset: '*' quality: 0.7.
	
	acceptEncoding := WAAcceptEncoding fromString: 'gzip,deflate'.
	self assert: acceptEncoding size = 2.
	self assert: acceptEncoding at: 1 encoding: 'gzip' quality: 1.0.
	self assert: acceptEncoding at: 2 encoding: 'deflate' quality: 1.0.
	
	accpetLanguage := WAAcceptLanguage fromString: 'de-de,de;q=0.8,en-us;q=0.5,en;q=0.3'.
	self assert: accpetLanguage size = 4.
	self assert: accpetLanguage at: 1 language: 'de' country: 'de' quality: 1.0.
	self assert: accpetLanguage at: 2 language: 'de' country: nil quality: 0.8.
	self assert: accpetLanguage at: 3 language: 'en' country: 'us' quality: 0.5.
	self assert: accpetLanguage at: 4 language: 'en' country: nil quality: 0.3