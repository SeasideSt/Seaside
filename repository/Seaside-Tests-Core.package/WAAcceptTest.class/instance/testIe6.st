tests
testIe6
	| accept acceptLanguage acceptEncoding |
	accept := WAAccept fromString: 'image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/vnd.ms-excel, application/msword, application/vnd.ms-powerpoint, application/x-shockwave-flash, */*'.
	self assert: accept size = 9.
	self assert: accept at: 1 main: 'image' sub: 'gif' quality: 1.0.
	self assert: accept at: 2 main: 'image' sub: 'x-xbitmap' quality: 1.0.
	self assert: accept at: 3 main: 'image' sub: 'jpeg' quality: 1.0.
	self assert: accept at: 4 main: 'image' sub: 'pjpeg' quality: 1.0.
	self assert: accept at: 5 main: 'application' sub: 'vnd.ms-excel' quality: 1.0.
	self assert: accept at: 6 main: 'application' sub: 'msword' quality: 1.0.
	self assert: accept at: 7 main: 'application' sub: 'vnd.ms-powerpoint' quality: 1.0.
	self assert: accept at: 8 main: 'application' sub: 'x-shockwave-flash' quality: 1.0.
	self assert: accept at: 9 main: '*' sub: '*' quality: 1.0.
	
	acceptEncoding := WAAcceptEncoding fromString: 'gzip, deflate'.
	self assert: acceptEncoding size = 2.
	self assert: acceptEncoding at: 1 encoding: 'gzip' quality: 1.0.
	self assert: acceptEncoding at: 2 encoding: 'deflate' quality: 1.0.
	
	acceptLanguage := WAAcceptLanguage fromString: 'de-ch'.
	self assert: acceptLanguage size = 1.
	self assert: acceptLanguage at: 1 language: 'de' country: 'ch' quality: 1.0