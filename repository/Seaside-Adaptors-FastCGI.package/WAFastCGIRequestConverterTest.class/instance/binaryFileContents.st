private
binaryFileContents

	| multipartBoundaryString crlf strm bytes header trailer |
	multipartBoundaryString := '----WebKitFormBoundaryPlIcHP7dkpjoZ17w'.
	crlf := Character cr asString , Character lf asString.
	strm := WriteStream on: String new.
	strm 
		nextPutAll: '--', multipartBoundaryString;
		nextPutAll: crlf;
		nextPutAll: 'Content-Disposition: form-data; name="4"; filename="findmenu.png"';
		nextPutAll: crlf;
		nextPutAll: 'Content-Type: image/png';
		nextPutAll: crlf;
		nextPutAll: crlf.
	bytes := self binaryFileByteArray.
	header := strm contents.
	trailer := crlf,  crlf, '--', multipartBoundaryString, '--'.
	^bytes copyFrom:  header size + 1 to: bytes size - trailer size