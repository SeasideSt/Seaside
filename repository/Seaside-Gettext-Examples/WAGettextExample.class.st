Class {
	#name : #WAGettextExample,
	#superclass : #WAComponent,
	#category : 'Seaside-Gettext-Examples'
}

{ #category : #localization }
WAGettextExample class >> export [
	"Gettext exporter has only been tested in Pharo -- will not work on Gemstone."
	(Smalltalk at: #WAGetTextExporter) new perform: #exportTemplate
]

{ #category : #localization }
WAGettextExample class >> import [
	"NaturalLanguageTranslator translators valuesDo: [ :each |
		each reloadMOFiles ]."
	NaturalLanguageTranslator reset
]

{ #category : #'class initialization' }
WAGettextExample class >> initialize [
	self register
]

{ #category : #'class initialization' }
WAGettextExample class >> register [
	| application |
	application := WAAdmin 
		register: self
		asApplicationAt: 'gettext'.
	application preferenceAt: #sessionClass put: WAGettextExampleSession.
	application configuration addParent: WAGetTextConfiguration instance.
	TextDomainManager registerCategoryPrefix: 'Seaside-Gettext-Examples' domain: 'gettext'.
]

{ #category : #'class initialization' }
WAGettextExample class >> unload [
	TextDomainManager unregisterDomain: 'gettext'
]

{ #category : #accessing }
WAGettextExample >> availableLocales [
	^ Array
		with: (WALocale language: 'en')
		with: (WALocale language: 'de' country: 'DE')
		with: (WALocale language: 'de' country: 'CH')
		with: (WALocale language: 'fr')
		with: (WALocale language: 'it')
]

{ #category : #rendering }
WAGettextExample >> renderContentOn: html [
	html heading: [ html translate: 'fontsize' ].
	self renderLocaleSelectionOn: html
]

{ #category : #rendering }
WAGettextExample >> renderLocaleSelectionOn: html [
	html unorderedList: [
		self availableLocales do: [ :each |
			html listItem: [
				html anchor
					callback: [ self session locale: each ];
					with: [ html translate: 'locale' to: each ] ] ] ]
]
