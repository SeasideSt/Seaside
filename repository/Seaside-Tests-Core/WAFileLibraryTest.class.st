Class {
	#name : #WAFileLibraryTest,
	#superclass : #WAContextTest,
	#category : 'Seaside-Tests-Core-Libraries'
}

{ #category : #tests }
WAFileLibraryTest >> testAsFilename [
	| library |
	library := WATestingFiles default.
	self assert: (library asFilename: #mainJs) = 'main.js'.
	self assert: (library asFilename: #style2Css) = 'style2.css'.
	self assert: (library asFilename: #index) = 'index'
]

{ #category : #tests }
WAFileLibraryTest >> testAsSelector [
	self assert: (WAFileLibrary asSelector: 'main.css') = #mainCss.
	self assert: (WAFileLibrary asSelector: 'main.js') = #mainJs.
	self assert: (WAFileLibrary asSelector: 'style-2.css') = #style2Css.
	self assert: (WAFileLibrary asSelector: 'style_2.css') = #style2Css.
	
	"https://code.google.com/p/seaside/issues/detail?id=786"
	self assert: (WAFileLibrary asSelector: 'main') = #main.
	self assert: (WAFileLibrary asSelector: 'main.') = #main.
	self assert: (WAFileLibrary asSelector: ').find(') isNil.
	self assert: (WAFileLibrary asSelector: '),10)') isNil
]

{ #category : #tests }
WAFileLibraryTest >> testAsSelectorCapitalized [
	| library |
	library := WATestingFiles default.
	self assert: (library asSelector: 'COMMENTS.TXT') = #COMMENTSTxt.
	self assert: (library asFilename: #COMMENTSTxt) = 'COMMENTS.txt'
]

{ #category : #tests }
WAFileLibraryTest >> testAsSelectorFunky [
	self assert: (WAFileLibrary asSelector: '1_2$3-4/5()6!7   8.9.test 1 2 3 me 4 5 6 .txt') = #test123me456Txt
]

{ #category : #tests }
WAFileLibraryTest >> testAsSelectorLeadingDigits [
	| library |
	library := WATestingFiles default.
	self assert: (library asSelector: '1readme.txt') = #readmeTxt.
	self assert: (library asSelector: '123456789readme.txt') = #readmeTxt.
	self assert: (library asSelector: '123456789readme89.txt') = #readme89Txt
]

{ #category : #tests }
WAFileLibraryTest >> testCompileByteArray [
	| library file |
	library := WATestingFiles default.
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
		self assert: first = data.
		second := library perform: #demoJpeg.
		self assert: first = second
	] ensure: [
		library removeFile: file fileName.
		self deny: (library class selectors includes: #demoJpeg) ]

]

{ #category : #tests }
WAFileLibraryTest >> testCompileByteArrayAgain [
	| library file |
	library := WATestingFiles default.
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
		self assert: first = data.
		second := library perform: #demoJpeg.
		self assert: first = second.
	
		data := (1 to: 255) reverse asByteArray.
		file := WAFile new
			contentType: WAMimeType imageJpeg;
			contents: data;
			fileName: 'demo.jpeg';
			yourself.
		library addFile: file.
		self assert: (library class selectors includes: #demoJpeg).
		first := library perform: #demoJpeg.
		self assert: first = data.
		second := library perform: #demoJpeg.
		self assert: first = second
	] ensure: [
		library removeFile: file fileName.
		self deny: (library class selectors includes: #demoJpeg) ]

]

{ #category : #tests }
WAFileLibraryTest >> testCompileString [
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

]

{ #category : #tests }
WAFileLibraryTest >> testCompileStringAgain [
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
		self assert: first == second.
		data := 'this is another string'.
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

]

{ #category : #tests }
WAFileLibraryTest >> testFilenames [
	| filenames |
	filenames := WATestingFiles default filenames.
	self assert: filenames size = 2.
	self assert: (filenames includes: 'sample.png').
	self assert: (filenames includes: 'sample.js')
]

{ #category : #tests }
WAFileLibraryTest >> testIsBinary [
	self deny: (WAFileLibrary isBinary: 'scipt.js').
	self deny: (WAFileLibrary isBinary: 'markup.xml').
	self deny: (WAFileLibrary isBinary: 'markup.xhtml').
	self deny: (WAFileLibrary isBinary: 'markup.html').
	self deny: (WAFileLibrary isBinary: 'file.txt').
	self deny: (WAFileLibrary isBinary: 'calendar.ics').
	self assert: (WAFileLibrary isBinary: 'image.jpeg').
	self assert: (WAFileLibrary isBinary:  'squeak.exe')
]

{ #category : #tests }
WAFileLibraryTest >> testMainJs [
	| handler response |
	handler := WAFileHandler new.
	self requestContextWithUrl: '/i/dont/care/main.js'.
	self requestContext consumer next; next; next.
	response := self responseAfter: [ handler handle: self requestContext ].
	self assert: response status = 404
]

{ #category : #tests }
WAFileLibraryTest >> testMimeType [
	| library |
	library := WATestingFiles default.
	self assert: (library mimetypeForFile: 'main.js') = 'application/x-javascript' seasideMimeType.
	self assert: (library mimetypeForFile: 'style2.css') = WAMimeType textCss.
	self assert: (library mimetypeForFile: 'image.jpg') = WAMimeType imageJpeg.
	self assert: (library mimetypeForFile: 'index') = WAMimeType applicationOctetStream
]

{ #category : #tests }
WAFileLibraryTest >> testName [
	"Issue 620: 	WAFileLibrary>>name answers a Symbol, but used in places where String should be used
	http://code.google.com/p/seaside/issues/detail?id=620
	
	Issue 186: 	WAFileLibrary>>deployFiles fail if folder already exists
	http://code.google.com/p/glassdb/issues/detail?id=186
	
	Avoid having a Symbol because otherwise deploying the files on GemStone fails because equality checks with existing files always anser false."
	| library |
	library := WATestingFiles default.
	self assert: library name = 'WATestingFiles'.
	self assert: library name isString.
	self deny: library name isSymbol
]

{ #category : #tests }
WAFileLibraryTest >> testNoneStatisfy [
	self deny: (#(1 2 3) noneSatisfy: [ :each |
		each even ]).
	self assert: (#(1 3 5) noneSatisfy: [ :each |
		each even ])
]

{ #category : #tests }
WAFileLibraryTest >> testSamplePng [
	| handler library response stream contents |
	handler := WAFileHandler new.
	library := WATestingFiles default.
	self requestContextWithUrl: '/i/dont/care/WATestingFiles/sample.png'.
	requestContext consumer next; next; next.
	response := self responseAfter: [ handler handle: self requestContext ].
	self assert: response status = 200.
	self assert: response contentType = WAMimeType imagePng.
	stream := WriteStream on: ByteArray new.
	response writeContentOn: stream.
	contents := stream contents.
	self assert: contents asByteArray = (library perform: #samplePng)

]

{ #category : #tests }
WAFileLibraryTest >> testUrlOf [
	self assert: (WATestingFiles / #samplePng) greaseString = '/files/WATestingFiles/sample.png'
]
