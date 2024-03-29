Class {
	#name : 'WAGetTextExporter',
	#superclass : 'Object',
	#instVars : [
		'exportFile',
		'stream',
		'rbEnvironment'
	],
	#category : 'Seaside-Pharo-Gettext-Core',
	#package : 'Seaside-Pharo-Gettext-Core'
}

{ #category : 'instance creation' }
WAGetTextExporter class >> newForRBEnvironment: aRBEnvironment [
	^ self new rbEnvironment: aRBEnvironment
]

{ #category : 'exporting' }
WAGetTextExporter >> createAndSortTriplets: translationLiterals [

	| msgid sortedMethods sortKey comment commentUnderLined triplets |
	triplets := translationLiterals associations collect: [ :assoc |
		            msgid := assoc key.
		            sortedMethods := assoc value asArray sort.
		            sortKey := sortedMethods first printString , ',', msgid.
		            comment := String streamContents:[ :str | 
										sortedMethods 
											do: [ :each | str nextPutAll: each actualClass asString ; nextPutAll: '>>'; nextPutAll: each selector asString ]
			                       	separatedBy: [ str nextPut: $, ] ].
		            "Replace white spaces to := because gettext tool might replace a space to a new line some times, and it makes difficult to take a diff."
		            commentUnderLined := comment copyReplaceAll: ' ' with: ':='.
		            Array with: sortKey with: commentUnderLined with: msgid ].

	^ triplets sort: [ :a :b | a first <= b first ]
]

{ #category : 'private' }
WAGetTextExporter >> createHeaders [
	| headers |
	headers := OrderedCollection new.
	headers add: 'Project-Id-Version' -> 'Pharo'.
	headers add: 'POT-Creation-Date' -> self currentDateAndTime.
	headers add: 'PO-Revision-Date' -> self currentDateAndTime.
	headers add: 'Last-Translator' -> ''.
	headers add: 'Language-Team' -> ''.
	headers add: 'MIME-Version' -> '1.0'.
	headers add: 'Content-Type' -> ('text/plain; charset=utf-8').
	headers add: 'Content-Transfer-Encoding' -> '8bit'.
	headers add: 'X-Pharo-SystemVersion' -> SystemVersion current asString.
	^ headers
]

{ #category : 'exporting' }
WAGetTextExporter >> createStringMethodRefDictionary: methodRefStringAssociations [
	| literals |
	literals := Dictionary new.
	methodRefStringAssociations do: [ :assoc |
		| methodReference keywords |
		methodReference := assoc key.
		keywords := assoc value.
		keywords do: [ :literal |
			| references |
			references := literals at: literal ifAbsentPut: [ Set new ].
			references add: methodReference ] ].
	^ literals 
]

{ #category : 'private' }
WAGetTextExporter >> currentDateAndTime [
	^ String
		streamContents: [ :aStream | 
			aStream nextPutAll: Date today yyyymmdd;
				space.
			Time now
				print24: true
				showSeconds: false
				on: aStream.
			aStream nextPutAll: '-0000' ]
]

{ #category : 'exporting' }
WAGetTextExporter >> exportCatalog [

	| translationLiterals |
	translationLiterals := self gatherTranslations.
	[
		stream := exportFile asFileReference ensureDelete; writeStream.
		self exportHeader.
		self exportLiteralsDict: translationLiterals 
	] ensure: [ stream close ]
]

{ #category : 'accessing' }
WAGetTextExporter >> exportFile: file [
	exportFile := file.
	
]

{ #category : 'exporting' }
WAGetTextExporter >> exportHeader [

	| headers |
	self exportTag: 'msgid' msg: ''.
	self exportTag: 'msgstr' msg: ''.
	headers := self createHeaders.
	headers do: [ :each | self exportHeaderLineKey: each key value: each value ].
	stream lf; lf
]

{ #category : 'exporting' }
WAGetTextExporter >> exportHeaderLineKey: keyString value: valueString [

	stream nextPut: $";
		 nextPutAll: keyString;
		 nextPut: $:;
		 space;
		 nextPutAll: valueString;
		 nextPutAll: '\n';
		 nextPut: $";
		 lf.
]

{ #category : 'exporting' }
WAGetTextExporter >> exportLiteralsDict: translationLiterals [ 
	"Export a gettext file body. translationLiterals is a dictionary of keyword -> #(MethodReference...)"
	| sortedTriplets |
	
	sortedTriplets := self createAndSortTriplets: translationLiterals. "sort triplets per package/category"		
	self exportSortedTriplets: sortedTriplets. 									"export the msgid and leave msgstr empty"
]

{ #category : 'exporting' }
WAGetTextExporter >> exportPhrase: phraseString [

	phraseString isEmpty ifTrue: [ ^ self ].
	self exportTag: 'msgid' msg: phraseString.
	self exportTag: 'msgstr' msg: ''.
	stream cr
]

{ #category : 'exporting' }
WAGetTextExporter >> exportRecordHeader: aHeader [
	stream 
		nextPutAll: '#: ';
		nextPutAll: aHeader;
		lf.
]

{ #category : 'exporting' }
WAGetTextExporter >> exportSortedTriplets: sortedTriplets [

	| comment msgid |
	sortedTriplets do: [ :triplet | 
		comment := triplet second.
		msgid := triplet third.
		self exportRecordHeader: comment.
		self exportPhrase: msgid ]
]

{ #category : 'exporting' }
WAGetTextExporter >> exportTag: tag msg: aString [

	| pos end line |
	(aString indexOf: Character lf) = 0
		ifTrue: [ self exportTag: tag singleLine: aString ]
		ifFalse: [ 
			self exportTag: tag singleLine: ''.
			"The string has an LF character. Process the string per LF"
			pos := 1.
			end := 0.
			[ end < aString size ] whileTrue: [ 
				end := aString indexOf: Character lf startingAt: pos.
				end = 0 ifTrue: [ end := aString size ].
				line := aString copyFrom: pos to: end.
				stream
					nextPut: $";
					nextPutAll: (self formatString: line);
					nextPut: $";
					lf.
				pos := end + 1 ] ]
]

{ #category : 'exporting' }
WAGetTextExporter >> exportTag: tag singleLine: aString [ 
	stream nextPutAll: tag.
	stream space.
	stream nextPut: $".
	stream
		nextPutAll: (self formatString: aString).
	stream nextPut: $".
	stream lf
]

{ #category : 'private' }
WAGetTextExporter >> formatString: aString [

	| result replacements |
	
	replacements := OrderedCollection new.
	replacements add: '\' -> '\\'.
	replacements add: String lf -> '\r'.
	replacements add: String tab -> '\t'.
	replacements add: '"' -> '\"'.
	
	result := aString.
	replacements do: [ :each | 
		result := result copyReplaceAll: each key with: each value ].
	^ result
]

{ #category : 'exporting' }
WAGetTextExporter >> gatherTranslations [
	| found |
	"Through WATranslatedArgumentsFinder, it finds all 'someString' seasideTranslated 
	translations, and variations on that (e.g. seasideLazyTranslated) 
	returns literals, which is a dictionary of 'someString' -> #(MethodReference...)"
	found := WATranslatedArgumentsFinder new translatedArgumentsIn: rbEnvironment.
	^ self createStringMethodRefDictionary: found.
]

{ #category : 'initialization' }
WAGetTextExporter >> initialize [
	super initialize.
	exportFile := FileLocator workingDirectory / 'translations_catalog.pot'.
	
]

{ #category : 'accessing' }
WAGetTextExporter >> rbEnvironment: aRBBrowserEnvironment [
	rbEnvironment := aRBBrowserEnvironment
]

{ #category : 'accessing' }
WAGetTextExporter >> stream [
	^ stream
]

{ #category : 'accessing' }
WAGetTextExporter >> stream: aStream [
	stream := aStream
]
