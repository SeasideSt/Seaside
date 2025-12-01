"
I am the WAGetTextTranslator, I manage translations that are imported from `.mo` files.

I am responsible for:
* Managing all available translators (1 translator per set of files with multiple locales)
* Translate for a given locale

My collaborators are:

WAMOFile is a class representing the `.mo` file and needed for the actual translation.

WALocale represents the locale.

WALocalizationContext is a class that uses me a lot in order to translate.

Public API and Key Messages

```
WAGetTextTranslator
		createTranslatorFor: 'seaside-gettext-example'
		fromFiles: (FileLocator imageDirectory / 'some' / 'path' / 'to' / 'mo' / 'files') asFileReference
```
See implementation details about some conventions for the path to `.mo` files.

Internal Representation and Key Implementation Points.

    Instance Variables
	moFiles:		`{'en'->WAMOfile, 'nl-BE'->WAMOFile}` (the locale strings are examples)

Implementation details, conventions about the path for `.mo` files:

A path to `.mo` files expects the following structure:

""
 * nl_BE
  * LC_MESSAGES
   * seaside-gettext-example.mo
 * fr
  * LC_MESSAGES
   * seaside-gettext-example.mo
 * de_CH
  * LC_MESSAGES
   * seaside-gettext-example.mo
 * en
  * LC_MESSAGES
   * seaside-gettext-example.mo
""

Note: the locale names are examples, ""seaside-gettext-example"" is also an example name. LC_MESSAGES is not an example that is how it should be called.
"
Class {
	#name : 'WAGetTextTranslator',
	#superclass : 'Object',
	#instVars : [
		'moFilePerLocaleId'
	],
	#classVars : [
		'TranslatorRegistry'
	],
	#category : 'Seaside-Gettext-Core',
	#package : 'Seaside-Gettext-Core'
}

{ #category : 'translators registry' }
WAGetTextTranslator class >> addTranslator: aTranslator for: anApplicationName [
	"Register translator for the named application"
	TranslatorRegistry 
		at: anApplicationName
		put: aTranslator
]

{ #category : 'translators registry' }
WAGetTextTranslator class >> addTranslatorFor: anApplicationName fromFiles: aCollectionOfMOFiles [
	"Create and register a translator for the named application with given gettext translation files"
	self 
		addTranslator: (self newFromMOFiles: aCollectionOfMOFiles)
		for: anApplicationName
]

{ #category : 'translators registry' }
WAGetTextTranslator class >> addTranslatorFor: anApplicationName fromFilesIn: aDirectoryPathString [
	"Create and register a translator for the named application with gettext translation files located in the given directory.
	The argument directory is the top directory of the Gettext translation filestructure."
	self 
		addTranslator: (self newFromMOFilesIn: aDirectoryPathString forName: anApplicationName)
		for: anApplicationName
]

{ #category : 'class initialization' }
WAGetTextTranslator class >> initialize [
	TranslatorRegistry := Dictionary new
]

{ #category : 'instance creation' }
WAGetTextTranslator class >> newFromMOFiles: aCollectionOfMOFiles [
	| translator |
	translator := self new.
	aCollectionOfMOFiles do:[ :moFile | 
		translator addMOFile: moFile forLocaleID: moFile localeId ].
	^ translator
]

{ #category : 'instance creation' }
WAGetTextTranslator class >> newFromMOFilesIn: aFileReference forName: anApplicationName [
	^ self basicNew initializeFromMOFilesIn: aFileReference forName: anApplicationName
]

{ #category : 'translators registry' }
WAGetTextTranslator class >> removeTranslatorFor: anApplicationName [
	^ TranslatorRegistry removeKey: anApplicationName
]

{ #category : 'translators registry' }
WAGetTextTranslator class >> translatorFor: anApplicationName [
	^ TranslatorRegistry at: anApplicationName ifAbsent: [ nil ]
]

{ #category : 'private' }
WAGetTextTranslator >> addMOFile: moFile forLocaleID: localeId [ 
  ^ moFilePerLocaleId
    at: localeId
    put: moFile
]

{ #category : 'private' }
WAGetTextTranslator >> addMOFileFromPath: pathString forName: anApplicationName [

	| locale fileName |
	locale := WALocale fromString: (GRPlatform current localNameOf: pathString).
	fileName := String streamContents: [ :str | 
		            str
			            nextPutAll: pathString;
			            nextPutAll: GRPlatform current pathSeparator;
			            nextPutAll: 'LC_MESSAGES';
			            nextPutAll: GRPlatform current pathSeparator;
			            nextPutAll: anApplicationName;
			            nextPutAll: '.mo' ].
	^ self
		  addMOFile: (WAMOFile new initializeFromFile: fileName localeId: locale localeId)
		  forLocaleID: locale localeId
]

{ #category : 'initialization' }
WAGetTextTranslator >> initialize [
	super initialize.
	 moFilePerLocaleId := Dictionary new.
]

{ #category : 'initialization' }
WAGetTextTranslator >> initializeFromMOFilesIn: aDirectoryPathString forName: anApplicationName [
  self initialize.
  (GRPlatform current directoriesIn: aDirectoryPathString)
    do: [ :dirPathString | self addMOFileFromPath: dirPathString forName: anApplicationName ]
]

{ #category : 'private' }
WAGetTextTranslator >> moFilePerLocaleId [
	^ moFilePerLocaleId
]

{ #category : 'accessing' }
WAGetTextTranslator >> supportedLocaleIds [
	^ moFilePerLocaleId keys
]

{ #category : 'translation' }
WAGetTextTranslator >> translate: aString usingLocale: aWALocale [

	| result |
	result := moFilePerLocaleId at: aWALocale localeId
		ifPresent: [ :mo | mo translationFor: aString ]
		ifAbsent: [ GetTextUnsucessfulTranslationResult original: aString ].

	"Sometimes locale have have names such as en-US but our locale is en, it then needs to ignore the country"
	^ (result isSuccessful not and: [ aWALocale country notNil ])
		  ifTrue: [ self translateIgnoringCountry: aString usingLocale: aWALocale ]
		  ifFalse: [ result translation ]
]

{ #category : 'translation' }
WAGetTextTranslator >> translateIgnoringCountry: aString usingLocale: aWALocale [
	^ self translate: aString usingLocale: aWALocale withoutCountry
]
