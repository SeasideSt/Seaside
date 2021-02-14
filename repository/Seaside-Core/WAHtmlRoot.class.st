"
A WAHtmlRoot is the root element of an HTML Document (<html>).

Instance Variables
	bodyAttrs:		<WAHtmlAttributes>
	context:			<WARenderContext>
	docType:		<String>
	headAttrs:		<WAHtmlAttributes>
	headElements:	<OrderedCollection<WAHtmlElement>>
	htmlAttrs:		<WAHtmlAttributes>
	scripts:			<Set<String>>
	styles:			<Set<String>>
	title:			<String>

bodyAttrs
	- the attributes of the <body> element

context
	- the context used to render the contents of the <body> element

docType
	- the document type

headAttrs
	- the attributes of the <head> element

headElements
	- the elements inside the <head> section

htmlAttrs
	- the attributes of the <html> element

scripts
	- contains the strings returned by WAPresenter >> #script

styles
	- contains the strings returned by WAPresenter >> #style

title
	- the title of the HTML document, the contents of the <title> element

"
Class {
	#name : #WAHtmlRoot,
	#superclass : #WARoot,
	#instVars : [
		'docType',
		'htmlAttrs',
		'headAttrs',
		'bodyAttrs',
		'headElements',
		'title',
		'styles',
		'scripts'
	],
	#category : 'Seaside-Core-Document'
}

{ #category : #adding }
WAHtmlRoot >> add: aHtmlElement [
	"Add a HTML head element to the receiver."

	^ headElements add: aHtmlElement
]

{ #category : #adding }
WAHtmlRoot >> addScript: aString [
	"Include the script aString into the receiver."

	scripts ifNil: [ scripts := Set new ].
	scripts add: aString
]

{ #category : #adding }
WAHtmlRoot >> addStyle: aString [
	"Include the style-sheet aString into the receiver."

	styles ifNil: [ styles := Set new ].
	styles add: aString
]

{ #category : #private }
WAHtmlRoot >> addXmlNamespaces [
	self htmlAttributes
		at: 'xmlns' put: 'http://www.w3.org/1999/xhtml';
		at: 'xml:lang' put: 'en';
		at: 'lang' put: 'en'
]

{ #category : #elements }
WAHtmlRoot >> base [
	^ self add: (WABaseElement root: self)
]

{ #category : #doctype }
WAHtmlRoot >> beHtml5 [
	self docType: '<!DOCTYPE html>'
]

{ #category : #'accessing-attributes' }
WAHtmlRoot >> bodyAttributes [
	^ bodyAttrs ifNil: [ bodyAttrs := WAHtmlAttributes new ]
]

{ #category : #writing }
WAHtmlRoot >> closeOn: aDocument [
	aDocument scriptGenerator
		close: self on: aDocument.
	self writeFootOn: aDocument
]

{ #category : #convenience }
WAHtmlRoot >> contentBase: urlString [
	self base url: urlString
]

{ #category : #doctype }
WAHtmlRoot >> docType [
	^ docType
]

{ #category : #doctype }
WAHtmlRoot >> docType: aString [
	"Set the document-type of the receiver. The table at http://www.w3.org/TR/2002/NOTE-xhtml-media-types-20020430/ summarizes the recommendation to content authors for labeling their XHTML documents:

Media type				XHTML 1.0 (HTML compatible)	XHTML 1.0 (other)	XHTML Basic / 1.1	XHTML+MathML
text/html				MAY							SHOULD NOT			SHOULD NOT			SHOULD NOT
application/xhtml+xml	SHOULD							SHOULD				SHOULD				SHOULD
application/xml			MAY							MAY				MAY				MAY
text/xml					MAY							MAY				MAY				MAY"

	docType := aString
]

{ #category : #'accessing-attributes' }
WAHtmlRoot >> headAttributes [
	^ headAttrs ifNil: [ headAttrs := WAHtmlAttributes new ]
]

{ #category : #accessing }
WAHtmlRoot >> headElements [
	^ headElements
]

{ #category : #accessing }
WAHtmlRoot >> headElements: anOrderedCollection [
	headElements := anOrderedCollection
]

{ #category : #'accessing-attributes' }
WAHtmlRoot >> htmlAttributes [
	^ htmlAttrs ifNil: [ htmlAttrs := WAHtmlAttributes new ]
]

{ #category : #elements }
WAHtmlRoot >> if [
	^ WAConditionalComment root: self
]

{ #category : #initialization }
WAHtmlRoot >> initialize [
	super initialize.
	headElements := OrderedCollection new.
	title := docType := String new
]

{ #category : #elements }
WAHtmlRoot >> javascript [
	^ self script beJavascript; yourself
]

{ #category : #elements }
WAHtmlRoot >> link [
	^ self add: (WALinkElement root: self)
]

{ #category : #elements }
WAHtmlRoot >> meta [
	^ self add: (WAMetaElement root: self)
]

{ #category : #writing }
WAHtmlRoot >> openOn: aDocument [
	aDocument scriptGenerator 
		open: self on: aDocument.
	self writeHeadOn: aDocument
]

{ #category : #convenience }
WAHtmlRoot >> redirectTo: aLocationString delay: aNumber [
	self meta redirectAfter: aNumber to: aLocationString
]

{ #category : #elements }
WAHtmlRoot >> revealedIf [
	^ WARevealedConditionalComment root: self
]

{ #category : #elements }
WAHtmlRoot >> script [
	^ self add: (WAScriptElement root: self)
]

{ #category : #elements }
WAHtmlRoot >> style [
	^ self add: (WAStyleElement root: self)
]

{ #category : #convenience }
WAHtmlRoot >> style: aString [
	self style with: aString
]

{ #category : #elements }
WAHtmlRoot >> stylesheet [
	^ self link beStylesheet; beCss; yourself
]

{ #category : #'accessing-properties' }
WAHtmlRoot >> title [
	^ title
]

{ #category : #'accessing-properties' }
WAHtmlRoot >> title: aString [
	title := aString
]

{ #category : #writing }
WAHtmlRoot >> writeElementsOn: aDocument [
	aDocument openTag: 'title'; nextPutAll: title; closeTag: 'title'.
	headElements do: [ :each | aDocument print: each ]
]

{ #category : #writing }
WAHtmlRoot >> writeFootOn: aDocument [
	aDocument closeTag: 'body'.
	aDocument closeTag: 'html'
]

{ #category : #writing }
WAHtmlRoot >> writeHeadOn: aDocument [
	aDocument nextPutAll: docType.
	aDocument openTag: 'html' attributes: htmlAttrs.
	aDocument openTag: 'head' attributes: headAttrs.
	self writeElementsOn: aDocument.
	self writeStylesOn: aDocument.
	self writeScriptsOn: aDocument.
	aDocument closeTag: 'head'.
	aDocument openTag: 'body' attributes: bodyAttrs
]

{ #category : #writing }
WAHtmlRoot >> writeScriptsOn: aDocument [
	scripts ifNil: [ ^ self ].
	scripts do: [ :each |
		aDocument print: ((WAScriptElement root: self)
			beJavascript;
			document: each;
			yourself) ]
]

{ #category : #writing }
WAHtmlRoot >> writeStylesOn: aDocument [
	styles ifNil: [ ^ self ].
	styles do: [ :each |
		aDocument print: ((WALinkElement root: self)
			beStylesheet; beCss;
			document: each;
			yourself) ]
]
