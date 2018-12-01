Class {
	#name : #SUClassBrowser,
	#superclass : #WAComponent,
	#instVars : [
		'class',
		'selector'
	],
	#category : 'Scriptaculous-Tests-Core-Functional'
}

{ #category : #'instance creation' }
SUClassBrowser class >> onClass: aClass [
	^ self new setClass: aClass
]

{ #category : #rendering }
SUClassBrowser >> renderCloseOn: html [
	html submitButton
		callback: [ self answer ];
		with: 'Close'
]

{ #category : #rendering }
SUClassBrowser >> renderContentOn: html [
	html form id: 'browser'; with: [
		html heading: class fullName.
		html div
			class: 'selectors';
			with: [ self renderSelectorsOn: html ].
		html div
			id: 'source';
			with: [ self renderSourceOn: html ].
		html div
			class: 'close';
			with: [ self renderCloseOn: html ] ]
]

{ #category : #rendering }
SUClassBrowser >> renderSelectorsOn: html [
	html select
		size: 5;
		selected: selector;
		list: self selectors;
		callback: [ :value | self setSelector: value ];
		onChange: (html scriptaculous updater
			id: 'source';
			triggerForm: 'browser';
			on: #renderSourceOn: of: self)
]

{ #category : #rendering }
SUClassBrowser >> renderSourceOn: html [ 
	| source |
	source := (self sourceCode ifNil: [ ^ self ]) greaseString readStream.
	html
		strong: class name , '>>' , source nextLine;
		break.
	[ source atEnd ] whileFalse: [
		[ source peek = Character tab ] whileTrue: [
			html
				space;
				space;
				space.
			source next ].
		html
			render: source nextLine;
			break ]
]

{ #category : #accessing }
SUClassBrowser >> selectors [
	^ class selectors sorted
]

{ #category : #initialization }
SUClassBrowser >> setClass: aClass [ 
	class := aClass.
	self setSelector: #renderContentOn:
]

{ #category : #initialization }
SUClassBrowser >> setSelector: aSymbol [
	selector := aSymbol
]

{ #category : #accessing }
SUClassBrowser >> sourceCode [
	^ (class selectors includes: selector)
		ifTrue: [ class sourceCodeAt: selector ]
]

{ #category : #hooks }
SUClassBrowser >> style [
	^ '#lightbox {
	background: url(' , (SUAllTestLibrary / #demoGif) greaseString , ') repeat white;
	border: 1px solid #e8a400;
	padding: 1em;
	width: 640px;
}
#browser h1 {
	margin: 0;
	padding: 0;
	font-size: 15px;
	text-align: center;
	padding-bottom: 1em;
}
#browser select {
	width: 100%;
}
#browser .selectors {
	margin-bottom: 1em;
}
#browser #source {
	padding: 1em;
	margin-bottom: 1em;
	border: 1px solid #dddddd;
	background-color: #f5f5f5;
	font: 12px Lucida Sans Typewriter, Courier, monospace;
}
#browser .close {
	text-align: center;
}'
]
