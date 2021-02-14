Class {
	#name : #WAFileMetadataLibraryTest,
	#superclass : #WAContextTest,
	#category : 'Seaside-Tests-Core-Libraries'
}

{ #category : #tests }
WAFileMetadataLibraryTest >> testAsFileAndFoldername [
	| library |
	library := WATestingMetadataFileLibrary default.
	self assert: (library asFileAndFoldername: #mainCss) first equals: library name
]

{ #category : #tests }
WAFileMetadataLibraryTest >> testAsFileAndFoldernameWithSubfolders [
	| library fileAndFolderName |
	library := WATestingMetadataFileLibrary default.
	fileAndFolderName := library asFileAndFoldername: #jsbootstrapJs.
	
	self assert: fileAndFolderName first equals: library name, GRPlatform current pathSeparator, 'js'.
	self assert: fileAndFolderName last equals: 'bootstrap.js'
]

{ #category : #tests }
WAFileMetadataLibraryTest >> testAsFilename [
	| library |
	library := WATestingMetadataFileLibrary default.
	self assert: (library asFilename: #imgglyphiconshalflingsPng) = 'img/glyphicons-halflings.png'.
	self assert: (library asFilename: #jsbootstrapJs) =  'js/bootstrap.js'
]

{ #category : #tests }
WAFileMetadataLibraryTest >> testAsSelector [
	self assert: (WAFileMetadataLibrary asSelector: 'js/bootstrap.js') = #jsbootstrapJs.
	self assert: (WAFileMetadataLibrary asSelector: 'img/glyphicons-halflings.png') = #imgglyphiconshalflingsPng.
	self assert: (WAFileMetadataLibrary asSelector: 'css/bootstrap-responsive.css') = #cssbootstrapresponsiveCss
]

{ #category : #tests }
WAFileMetadataLibraryTest >> testCompileByteArray [
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
		self assert: first mimeType = file contentType.
		self assert: first filepath = file fileName.
		second := library perform: #demoJpeg.
		self assert: first contents value = second contents value
	] ensure: [
		library removeFile: file fileName.
		self deny: (library class selectors includes: #demoJpeg) ]

]

{ #category : #tests }
WAFileMetadataLibraryTest >> testCompileByteArrayAgain [
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

]

{ #category : #tests }
WAFileMetadataLibraryTest >> testCompileString [
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

]

{ #category : #tests }
WAFileMetadataLibraryTest >> testFilenames [
	| filenames |
	filenames := WATestingMetadataFileLibrary default filenames.
	self assert: filenames size = 3.
	self assert: (filenames includes: 'img/glyphicons-halflings.png').
	self assert: (filenames includes: 'js/bootstrap.js').
	self assert: (filenames includes: 'main.css')
]

{ #category : #tests }
WAFileMetadataLibraryTest >> testImgglyphiconshalflingsPng [
	| handler library response stream contents |
	handler := WAFileHandler new.
	library := WATestingMetadataFileLibrary default.
	self requestContextWithUrl: '/i/dont/care/WATestingMetadataFileLibrary/img/glyphicons-halflings.png'.
	requestContext consumer next; next; next.
	response := self responseAfter: [ handler handle: self requestContext ].
	self assert: response status = 200.
	self assert: response contentType = WAMimeType imagePng.
	stream := WriteStream on: ByteArray new.
	response writeContentOn: stream.
	contents := stream contents.
	self assert: contents asByteArray = (library perform: #imgglyphiconshalflingsPng) contents value

]

{ #category : #tests }
WAFileMetadataLibraryTest >> testIsBinary [
	self deny: (WAFileMetadataLibrary isBinary: 'scipt.js').
	self deny: (WAFileMetadataLibrary isBinary: 'markup.xml').
	self deny: (WAFileMetadataLibrary isBinary: 'markup.xhtml').
	self deny: (WAFileMetadataLibrary isBinary: 'markup.html').
	self deny: (WAFileMetadataLibrary isBinary: 'file.txt').
	self deny: (WAFileMetadataLibrary isBinary: 'calendar.ics').
	self assert: (WAFileMetadataLibrary isBinary: 'image.jpeg').
	self assert: (WAFileMetadataLibrary isBinary:  'squeak.exe')
]

{ #category : #tests }
WAFileMetadataLibraryTest >> testMimeType [
	| library |
	library := WATestingMetadataFileLibrary default.
	self assert: (library mimetypeOf: #imgglyphiconshalflingsPng) = WAMimeType imagePng.
	self assert: (library mimetypeOf: #jsbootstrapJs) =  'application/javascript' seasideMimeType
]

{ #category : #tests }
WAFileMetadataLibraryTest >> testName [
	"Issue 620: 	WAFileLibrary>>name answers a Symbol, but used in places where String should be used
	http://code.google.com/p/seaside/issues/detail?id=620
	
	Issue 186: 	WAFileLibrary>>deployFiles fail if folder already exists
	http://code.google.com/p/glassdb/issues/detail?id=186
	
	Avoid having a Symbol because otherwise deploying the files on GemStone fails because equality checks with existing files always anser false."
	| library |
	library := WATestingMetadataFileLibrary default.
	self assert: library name = 'WATestingMetadataFileLibrary'.
	self assert: library name isString.
	self deny: library name isSymbol
]

{ #category : #tests }
WAFileMetadataLibraryTest >> testUrlOf [
	self assert: (WATestingMetadataFileLibrary / #jsbootstrapJs) greaseString = '/files/WATestingMetadataFileLibrary/js/bootstrap.js'
]
