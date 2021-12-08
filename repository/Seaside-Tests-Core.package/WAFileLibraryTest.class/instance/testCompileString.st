tests
testCompileString
	| library file |
	library := WATestingFiles default.
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
		self assert: first = data.
		second := library perform: #demoTxt.
		self assert: first == second
	] ensure: [
		library removeFile: file fileName.
		self deny: (library class selectors includes: #demoTxt) ]