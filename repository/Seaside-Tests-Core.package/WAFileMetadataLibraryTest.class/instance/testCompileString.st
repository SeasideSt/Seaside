tests
testCompileString
	| library file |
	library := WATestingMetadataFileLibrary default.
	[
		| data first second |
		self deny: (library class selectors includes: #demoTxt).
	
		data := 'this is a string'.
		file := WAFile new
			contentType: WAMimeType textPlain;
			contents: data;
			fileName: 'demo.txt';
			yourself.
	
		library addFile: file.
		self assert: (library class selectors includes: #demoTxt).
		first := library perform: #demoTxt.
		self assert: first contents value = data.
		self assert: first mimeType = file contentType.
		self assert: first filepath = file fileName.
		second := library perform: #demoTxt.
		self assert: first contents value == second contents value
	] ensure: [
		library removeFile: file fileName.
		self deny: (library class selectors includes: #demoTxt) ]
