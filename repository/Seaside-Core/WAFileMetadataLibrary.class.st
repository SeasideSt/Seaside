"
I seek to address the following WAFileLibrary related issues:

-""""Arbitrary support for filenames"""" JQuery-UI theme libraries contain currently unsupported filenames such as ""e6e6e6_40x100_textures_02_glass_75.png"".
-""""Arbitrary directories for files"""" JQuery-UI (and Twitter Bootstrap) expects certain JavaScript files, images etc in a subdirectory, such as ""ui/i18n/ui.datepicker-de.js"".
-""""Arbitrary mime-types for files"""" Currently mime-types are determined from the file-extension, sometimes it would be good to have some more control.

WAAbstractFileLibrary has been introduced which acts as a base for the old file libraries derived from WAFileLibrary and introduces a new subclass WAFileMetadataLibrary. WAFileMetadataLibrary supports resources with paths, which is handy when, for example, the javascript or css in a file library expects its supporting images to be in subdirectories such as img/xxxx.png. WAFileMetadataLibrary also records the original filenames so that when you #deployFiles from the file library on a production server, the exported files will maintain their original names and paths.

There's a new method for recursing a sub-directory tree to add all the files and record their relative paths:

=MYWAFileMetadataDerivedFileLibrary recursivelyAddAllFilesIn: '/var/www/files/twitterbootstrap'
"
Class {
	#name : 'WAFileMetadataLibrary',
	#superclass : 'WAAbstractFileLibrary',
	#category : 'Seaside-Core-Libraries',
	#package : 'Seaside-Core',
	#tag : 'Libraries'
}

{ #category : 'private' }
WAFileMetadataLibrary class >> absolutePathFromRelative: aRelativeFilePath [
	| allFiles absoluteFile filePart |
	allFiles := GRPlatform current filesIn: aRelativeFilePath.
	allFiles isEmpty ifTrue: [
		allFiles := GRPlatform current directoriesIn: aRelativeFilePath ].
	
	absoluteFile := allFiles first.
	filePart := GRPlatform current localNameOf: absoluteFile.
	
	^ absoluteFile allButLast: filePart size
]

{ #category : 'private' }
WAFileMetadataLibrary class >> addFileAt: aPath relativeToRootDirectory: relativeRootDirectory [
	| relativeFilepath pathSeparator |
	relativeFilepath := aPath allButFirst: relativeRootDirectory size.
	pathSeparator := GRPlatform current pathSeparator.
	
	(relativeFilepath first = pathSeparator first) 
		ifTrue: [ relativeFilepath := relativeFilepath allButFirst ].

	relativeFilepath := relativeFilepath copyReplaceAll: pathSeparator with: '/'. 

	self addFileNamed: relativeFilepath
		contents: (GRPlatform current 
				contentsOfFile: aPath
				binary: (self isBinaryAt: aPath))
]

{ #category : 'file addition' }
WAFileMetadataLibrary class >> addFileNamed: filename contents: aByteArrayOrString [
	| selector mimeType code contentSelector |
	selector := self asSelector: filename.
	contentSelector := selector, 'Content'.
	mimeType := self mimetypeFor: (filename copyAfterLast: $.).
	
	code := String streamContents: [ :stream |
		stream
			nextPutAll: selector; nextPut: Character cr;
			nextPut: Character tab; nextPutAll: '^ WAFileLibraryResource'; nextPut: Character cr; 
			nextPut: Character tab; nextPut: Character tab; nextPutAll: 'filepath: '''; nextPutAll: filename; nextPutAll: ''''; nextPut: Character cr;
			nextPut: Character tab; nextPut: Character tab; nextPutAll: 'mimeType: (WAMimeType main: '''; nextPutAll: mimeType main; nextPutAll: ''' sub: '''; nextPutAll: mimeType sub; nextPutAll: ''')'; nextPut: Character cr;
			nextPut: Character tab; nextPut: Character tab; nextPutAll: 'cacheDuration: (Duration days: 0 hours: 0 minutes: 30 seconds: 0)'; nextPut: Character cr;
			nextPut: Character tab; nextPut: Character tab;  nextPutAll: 'contents: (GRDelayedSend receiver: self selector: #'; nextPutAll: contentSelector; nextPutAll: ')' ].
		
	GRPlatform current 
		compile: code
		into: self
		classified: self methodCategory, ' metadata'.
		
	(self isBinary: filename)
		ifTrue: [ self compileBinary: aByteArrayOrString selector: contentSelector ]
		ifFalse: [ self compileText: aByteArrayOrString selector: contentSelector ]
]

{ #category : 'file addition' }
WAFileMetadataLibrary class >> recursivelyAddAllFilesIn: aPathString [ 
	"adds all files in the directory specified by aPathString to the current file library - 
	*does* recurse into sub-directories"
	| isAbsolutePath rootPath |
	isAbsolutePath := (aPathString first = GRPlatform current pathSeparator first).
	rootPath := isAbsolutePath 
		ifTrue: [ aPathString ]
		ifFalse: [ self absolutePathFromRelative: aPathString ].
		
	self recursivelyAddAllFilesIn: aPathString relativeToRootDirectory: rootPath
]

{ #category : 'file addition' }
WAFileMetadataLibrary class >> recursivelyAddAllFilesIn: aPathString relativeToRootDirectory: relativeRootDirectory [
	(GRPlatform current directoriesIn: aPathString) do: [ :each | 
		self recursivelyAddAllFilesIn: each relativeToRootDirectory: relativeRootDirectory ].
	(GRPlatform current filesIn: aPathString) do: [ :each | 
		self addFileAt: each relativeToRootDirectory: relativeRootDirectory ]
]

{ #category : 'private' }
WAFileMetadataLibrary >> asFileAndFoldername: aSelector [
	| foldername filename pathSeparator |
	pathSeparator := GRPlatform current pathSeparator.
	filename := (self fileResourceOf: aSelector) filepath.
	"File resources in metadata libraries are always specified using the UNIX path separator convention"
	foldername := (filename includes: $/)
		ifTrue: [
			filename := filename copyReplaceAll: '/' with: pathSeparator.
			self name, pathSeparator, (filename copyUpToLast: pathSeparator first) ]
		ifFalse: [ self name ].
	^ Array with: foldername with: (GRPlatform current localNameOf: filename)
]

{ #category : 'private' }
WAFileMetadataLibrary >> asFilename: aSelector [
	^ (self fileResourceOf: aSelector) filepath
]

{ #category : 'actions' }
WAFileMetadataLibrary >> deployFiles [
	"Write to disk the files that the receiver use to serve as methods.
	The files are stored in a subfolder named like the classname of the receiver in a subfolder of Smalltalk image folder."
	
	GRPlatform current ensureExistenceOfFolder: self name.
	self fileSelectors do: [ :each | 
		| folderInfo |
		folderInfo := self asFileAndFoldername: each.
 		GRPlatform current ensureExistenceOfFolder: folderInfo first.
		GRPlatform current 
			write: (self fileResourceOf: each) contents value
			toFile: folderInfo second
			inFolder: folderInfo first ]
]

{ #category : 'private' }
WAFileMetadataLibrary >> fileResourceOf: aSelector [
	^ (self respondsTo: aSelector)
		ifTrue: [ self perform: aSelector ]
		ifFalse: [ WAFileLibraryResource emptyInstance ]
]

{ #category : 'private' }
WAFileMetadataLibrary >> fileSelectors [
	"deliberately name WAFileMetadataLibrary rather than self class"
	^ self fileSelectorsTo: WAFileMetadataLibrary
]

{ #category : 'accessing' }
WAFileMetadataLibrary >> fileSizeOf: aSelector [
	^ (self fileResourceOf: aSelector) contents value size
]

{ #category : 'handling' }
WAFileMetadataLibrary >> handle: aRequestContext [
	| filepath selector fileHandler fileResource |
	filepath := String streamContents: [ :stream | 
		aRequestContext consumer upToEnd
			do: [ :each | 
				stream nextPutAll: each ] 
			separatedBy: [ stream nextPutAll: GRPlatform current pathSeparator ] ].
		
	selector := self asSelector: filepath.
	(self fileSelectors includes: selector) 
		ifFalse: [ ^ self ].
	
	fileResource := self fileResourceOf: selector.
	fileHandler := aRequestContext handler.
	fileHandler useXSendfile
		ifTrue: [
			aRequestContext respond: [ :response |
				response
					cacheFor: fileResource cacheDuration;
					headerAt: 'X-Sendfile' put: (self fullPathForFileName: filepath using: fileHandler);
					contentType: fileResource mimeType ] ]
		ifFalse: [
			aRequestContext respond: [ :response |
				| document entityTag |
				document := fileResource contents value.
				entityTag := self entityTagFor: document.
				aRequestContext request ifNoneMatch = entityTag
					ifTrue: [ response notModified ]
					ifFalse: [ 
						response
							cacheFor: fileResource cacheDuration;
							entityTag: (self entityTagFor: document);
							document: document
							mimeType: fileResource mimeType ] ] ]
]

{ #category : 'private' }
WAFileMetadataLibrary >> isFileSelector: aSymbol [
	| isContentMethod |
	
	isContentMethod := aSymbol endsWithSubCollection: #Content.
	^ isContentMethod not  and:  [ super isFileSelector: aSymbol ]
]

{ #category : 'accessing' }
WAFileMetadataLibrary >> mimetypeOf: aSelector [
	^ (self fileResourceOf: aSelector) mimeType
]
