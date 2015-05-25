tests
testCompileByteArrayAgain
	| library file |
	library := WATestingMetadataFileLibrary default.
	[
		| data first second |
		self deny: (library class selectors includes: #demoJpeg).
		data := (1 to: 255) asByteArray.
		file := WAFile new
			contentType: WAMimeType imageJpeg;
			contents: data;
			fileName: 'demo.jpeg';
			yourself.
		library addFile: file.
		self assert: (library class selectors includes: #demoJpeg).
		first := library perform: #demoJpeg.
		self assert: first contents value = data.
		second := library perform: #demoJpeg.
		self assert: first contents value = second contents value.
	
		data := (1 to: 255) reverse asByteArray.
		file := WAFile new
			contentType: WAMimeType imageJpeg;
			contents: data;
			fileName: 'demo.jpeg';
			yourself.
		library addFile: file.
		self assert: (library class selectors includes: #demoJpeg).
		first := library perform: #demoJpeg.
		self assert: first contents value = data.
		second := library perform: #demoJpeg.
		self assert: first contents value = second contents value
	] ensure: [
		library removeFile: file fileName.
		self deny: (library class selectors includes: #demoJpeg) ]
