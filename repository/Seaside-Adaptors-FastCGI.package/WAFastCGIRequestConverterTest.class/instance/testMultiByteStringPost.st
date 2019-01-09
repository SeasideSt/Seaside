tests
testMultiByteStringPost
	| converter role request  utf8String multipartBoundaryString stdinStream paramsDictionary crlf x y |
	converter := WAFastCGIAdaptor new.
	converter codec: GRUtf8GemStoneCodec new.
	utf8String := #( 208 175 32 208 188 208 190 208 179 209 131 32 208 181 209 129 209 130 209 140 32 209 129 209 130 208 181 208 186 208 187 208 190 44 32 208 190 208 189 208 190 32 208 188 208 189 208 181 32 208 189 208 181 32 208 178 209 128 208 181 208 180 208 184 209 130 46) asByteArray asString.
	multipartBoundaryString := '----WebKitFormBoundaryYc4eWZ6BG8Jg5ZKm'.
	crlf := Character cr asString , Character lf asString.
	stdinStream := WriteStream on: String new.
	stdinStream 
		nextPutAll: '--', multipartBoundaryString;
		nextPutAll: crlf;
		nextPutAll: 'Content-Disposition: form-data; name="4"';
		nextPutAll: crlf;
		nextPutAll: crlf;
		nextPutAll: utf8String;
		nextPutAll: crlf;
		nextPutAll: '--', multipartBoundaryString;
		nextPutAll: crlf;
		nextPutAll: 'Content-Disposition: form-data; name="5"';
		nextPutAll: crlf;
		nextPutAll: crlf;
		nextPutAll: 'Seaside';
		nextPutAll: crlf;
		nextPutAll: '--', multipartBoundaryString, '--'.
	paramsDictionary := Dictionary new.
	paramsDictionary 
		at: 'REQUEST_URI' 
			put: '/tests/functional/WAInputPostMultipartFunctionalTest?_s=3BaOIlg4m9wyxSZ2&_k=AgZEmIExDvsgptk2';
		at: 'REQUEST_METHOD'
			put: 'POST';
		at: 'CONTENT_TYPE'
			put: 'multipart/form-data; boundary=', multipartBoundaryString;
		at: 'CONTENT_LENGTH'
			put: stdinStream contents size printString;
		at: 'SERVER_PROTOCOL'
			put: 'HTTP/1.1';
		at: 'REMOTE_ADDR'
			put: '10.80.250.51'.
	role := FSResponderRole new
		stdin: stdinStream contents asByteArray 
		params: paramsDictionary.
	request := converter requestFor: role.
	self assert: request isPost.
	self assert: request rawBody = stdinStream contents.
	self assert: (x := request bodyDecodeUsing: 'utf-8') = (y := stdinStream contents decodeFromUTF8).
	self assert: (request postFields at: '5') = 'Seaside'.
	self assert: (x := request postFields at: '4') = (y := utf8String decodeFromUTF8).