"
I am a  web based Smalltalk browser.
"
Class {
	#name : #WABrowser,
	#superclass : #WATool,
	#instVars : [
		'contents',
		'model',
		'message'
	],
	#category : 'Seaside-Pharo-Development-Core'
}

{ #category : #accessing }
WABrowser class >> browserClass [
	^ Smalltalk at: ((Smalltalk hasClassNamed: #Browser)
		ifTrue: [ #Browser ]
		ifFalse: [ #WARPackageBasedBrowser ])
]

{ #category : #testing }
WABrowser class >> canBeRoot [
	^ true
]

{ #category : #accessing }
WABrowser class >> description [
	^ 'Smalltalk Code Browser'
]

{ #category : #'instance creation' }
WABrowser class >> fullOnClass: aClass [
	^ self fullOnClass: aClass selector: nil
]

{ #category : #'instance creation' }
WABrowser class >> fullOnClass: aClass selector: aSelector [
	^ self new model: (self browserClass new setClass: aClass selector: aSelector)
]

{ #category : #initialization }
WABrowser class >> initialize [
	WAAdmin register: self asApplicationAt: 'tools/classbrowser'
]

{ #category : #actions }
WABrowser >> accept [
	| save |
	WADevelopment ensureAuthorInitialsWith: [ :question |
		self request: question ].
	message := nil.
	save := contents.
	model contents: contents notifying: self.
	contents := save
]

{ #category : #accessing }
WABrowser >> columns [
	^ #( systemCategory class messageCategory message )
]

{ #category : #accessing }
WABrowser >> contents [
	^ contents
]

{ #category : #accessing }
WABrowser >> contents: aString [ 
	"the browser sends CRLF as line ending but Squeak wants CR"
	contents := GRPlatform current convertToSmalltalkNewlines: aString
]

{ #category : #hooks }
WABrowser >> initialRequest: aRequest [
	| theClass |
	super initialRequest: aRequest.
	aRequest fields at: 'class' ifPresent: [ :className |
		Smalltalk at: className asSymbol ifPresent: [ :class |
			theClass := (aRequest fields includesKey: 'meta')
				ifTrue: [ class class ]
				ifFalse: [ class ].
			self model setClass: theClass selector: nil.
			aRequest fields at: 'method' ifPresent: [ :selector |
				self model setClass: theClass selector: selector asSymbol ] ] ]
]

{ #category : #initialization }
WABrowser >> initialize [
	super initialize.
	self model: self class browserClass new
]

{ #category : #accessing }
WABrowser >> model [
	^ model
]

{ #category : #accessing }
WABrowser >> model: aBrowserModel [
	model notNil ifTrue: [ model removeDependent: self ].
	aBrowserModel notNil ifTrue: [ aBrowserModel addDependent: self ].
	model := aBrowserModel.
	contents := model contents
]

{ #category : #notifying }
WABrowser >> notify: aString at: location in: sourceStream [
	message := aString allButLast: 3
]

{ #category : #rendering }
WABrowser >> renderColumnsOn: html [
	html div class: 'columns'; with: [
		self columns do: [ :each |
			html form class: 'column'; with: [
				| array |
				array := self model perform: (each , 'List') asSymbol.
				html div: [
					html select
						size: 10;
						list: array;
						"Very ugly hack to intentionally not delegate to WAScriptGenerator.
						If we delegate to WAScriptGenerator and the script generator is jQuery
						then #onChange: will result in
						$.bind('change', function(){submit()});
						which will blow up because submit() will not defined"
						attributeAt: 'onchange' put: 'submit()';
						selected: (array
							at: (self model perform: (each, 'ListIndex') asSymbol)
							ifAbsent: [ nil ]);
						callback: [ :item |
							self model
								perform: (each, 'ListIndex:') asSymbol
								with: (array indexOf: item) ] ] ] ] ] 
]

{ #category : #rendering }
WABrowser >> renderContentOn: html [
	self
		renderColumnsOn: html;
		renderModeButtonsOn: html;
		renderMessageOn: html;
		renderContentPaneOn: html
]

{ #category : #rendering }
WABrowser >> renderContentPaneOn: html [
	html form class: 'definition'; with: [
	 	html div: [
			html textArea on: #contents of: self.
			html break.
			html submitButton on: #accept of: self ] ]
]

{ #category : #rendering }
WABrowser >> renderMessageOn: html [
	message isNil
		ifFalse: [ html strong: message ]
]

{ #category : #rendering }
WABrowser >> renderModeButtonsOn: html [
	html form class: 'mode'; with: [
		html div: [
			html submitButton
				callback: [ self showInstance ];
				value: 'instance'.
			html submitButton
				callback: [ self showHelp ];
				value: 'help'.
			html submitButton
				callback: [ self showClass ];
				value: 'class' ] ]
]

{ #category : #notifying }
WABrowser >> select [
]

{ #category : #actions }
WABrowser >> selectFrom: aPos to: anotherPos [
]

{ #category : #accessing }
WABrowser >> selectionInterval [
	^ 1 to: 1
]

{ #category : #actions }
WABrowser >> showClass [
	self model indicateClassMessages
]

{ #category : #actions }
WABrowser >> showHelp [
	self model plusButtonHit
]

{ #category : #actions }
WABrowser >> showInstance [
	self model indicateInstanceMessages
]

{ #category : #hooks }
WABrowser >> states [
	^ Array with: model
]

{ #category : #hooks }
WABrowser >> style [
	^ 'form, div.columns {
	padding: 2px;
	margin: 0;
}

form.column {
	padding: 0;
	width: 25%;
	float: left;
}
form.column select {
	width: 100%;
	border: 1px solid #aaa;
}

form.mode {
	clear: both;
}

form.definition textarea {
	width: 100%;
	height: 200px;
	border: 1px solid #aaa;
}'
]

{ #category : #accessing }
WABrowser >> text [
	^ Text fromString: self contents
]

{ #category : #notifying }
WABrowser >> update: aSymbol [
	contents := model contents
]

{ #category : #updating }
WABrowser >> updateUrl: aUrl [
	super updateUrl: aUrl.
	self model selectedClass isNil ifFalse: [
		aUrl addField: 'class' value: self model selectedClass fullName.
		self model metaClassIndicated
			ifTrue: [ aUrl addField: 'meta' ] ].
	self model selectedMessageName isNil 
		ifFalse: [ aUrl addField: 'method' value: self model selectedMessageName ]
]
