"
I am an example of a web application that uses the WAGetTextTranslator under the hood, called: WAGettextExample.

I am responsible for: 
- importing the translation files that will be available during the lifetime of the web application. This also creates a WAGetTextTranslator instance that is registered with the WAGetTextTranslator class
- Registering my own instance at WAAdmin as my instance side is responsible for rendering HTML pages and things of that nature
- Exporting translations

My collaborators are: WAGetTextTranslator, WAAdmin, WAGetTextConfiguration, WAGettextExampleSession

Indirect collaborators: WALocalizationContextFilter (due to WAGettextExampleSession)

To initialize me, click on the icon next to `initialize` on my class side.

To adapt me, think about the following:
- In the register method you can type the web application name you want to use.
- in `importTranslations` the path name needs to be stated where the `.mo` files are. It expects the following structure:
```
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
```

Note: the locale names are examples, ""seaside-gettext-example"" is also an example name. LC_MESSAGES is not an example that is how it should be called.
"
Class {
	#name : 'WAGettextExample',
	#superclass : 'WAExampleComponent',
	#category : 'Seaside-Gettext-Examples',
	#package : 'Seaside-Gettext-Examples'
}

{ #category : 'localization' }
WAGettextExample class >> addTranslatorForExample [

	| localeIds moFiles |
	localeIds := #( 'nl_BE' 'fr' 'de_CH' ) collect: [ :str | (WALocale fromString: str) localeId ].
	moFiles := localeIds collect: [ :localeId | 
		           | contents |
		           contents := (WAGettextTestingFileLibrary new perform:
											(WAGettextTestingFileLibrary asSelector: localeId , '.mo')) contents.
		           WAMOFile
			           fromStream: contents readStream
			           localeId: localeId ].
	
	WAGetTextTranslator addTranslatorFor: 'seaside-gettext-example' fromFiles: moFiles
]

{ #category : 'accessing' }
WAGettextExample class >> description [
	^ 'A very simple application of Seaside Gettext'
]

{ #category : 'localization' }
WAGettextExample class >> export [
	"Gettext exporter has only been tested in Pharo -- will not work on Gemstone."
	(Smalltalk at: #WAGetTextExporter) new perform: #exportCatalog
]

{ #category : 'accessing' }
WAGettextExample class >> getTextExampleApplicationName [
	^ 'seaside-gettext-example'
]

{ #category : 'localization' }
WAGettextExample class >> importTranslations [
	WAGetTextTranslator
		addTranslatorFor: self getTextExampleApplicationName
		fromFilesIn: GRPlatform current seasideGettextExampleFilesDirectory
]

{ #category : 'class initialization' }
WAGettextExample class >> initialize [
	| application |
	application := WAAdmin register: self asApplicationAt: 'examples/gettext'.
	application configuration addParent: WAGetTextConfiguration instance.
	application preferenceAt: #sessionClass put: WAGettextExampleSession.
	application preferenceAt: #gettextApplicationName put: self getTextExampleApplicationName.
]

{ #category : 'localization' }
WAGettextExample class >> removeTranslatorForExample [

	WAGetTextTranslator removeTranslatorFor: 'seaside-gettext-example' 
]

{ #category : 'accessing' }
WAGettextExample >> availableLocales [
	^ Array
		with: (WALocale language: 'en')
		with: (WALocale language: 'de' country: 'CH')
		with: (WALocale language: 'fr')
		with: (WALocale language: 'nl' country: 'BE')
]

{ #category : 'private' }
WAGettextExample >> loadTranslationFilesFrom: aPathString [
	WAGetTextTranslator
		addTranslatorFor: 'seaside-gettext-example'
		fromFilesIn: aPathString
]

{ #category : 'rendering' }
WAGettextExample >> renderContentOn: html [
	html heading: [ html translate: 'fontsize' ].
	self renderLocaleSelectionOn: html.
	self renderTranslationFilesLoadOn: html.
]

{ #category : 'rendering' }
WAGettextExample >> renderLocaleSelectionOn: html [
	html paragraph: 'Select a locale below' seasideTranslated.
	html unorderedList: [
		self availableLocales do: [ :each |
			html listItem: [
				html anchor
					callback: [ self session locale: each ];
					with: [ 
						html translate: 'locale' to: each.
						html space.
						html text: each greaseString ] ] ] ]
]

{ #category : 'rendering' }
WAGettextExample >> renderTranslationFilesLoadOn: html [
	| path |
	html form:[
		html paragraph:'To change the translations of the text above, enter the path to the locale folder below and press Reload.'.
		html textInput
			value: (GRPlatform current fileNameFor: (GRPlatform current seasideGettextExampleFilesDirectory));
			size: 150;
			callback:[ :string | path := string ].
		html submitButton
			callback:[ self loadTranslationFilesFrom: path ];
			value: 'Reload'
		]
]
