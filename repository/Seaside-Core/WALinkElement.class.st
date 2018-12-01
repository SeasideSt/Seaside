"
Defines either a link or style sheet rules. If it has children then it defines style sheet rules, else it defines a link.

= if link =
This element defines a link. Unlike A, it may only appear in the HEAD section of a document, although it may appear any number of times. Although LINK has no content, it conveys relationship information that may be rendered by user agents in a variety of ways (e.g., a tool-bar with a drop-down menu of links).

= style sheet rules =
The STYLE element allows authors to put style sheet rules in the head of the document. HTML permits any number of STYLE elements in the HEAD section of a document.

User agents that don't support style sheets, or don't support the specific style sheet language used by a STYLE element, must hide the contents of the STYLE element. It is an error to render the content as part of the document's text. Some style sheet languages support syntax for hiding the content from non-conforming user agents.
"
Class {
	#name : #WALinkElement,
	#superclass : #WAContentElement,
	#category : 'Seaside-Core-Document-Elements'
}

{ #category : #'accessing-children' }
WALinkElement >> add: anElement [
	super add: anElement.
	attributes isNil ifFalse: [
		attributes removeKey: 'rel' ifAbsent: [ "ignore" ] ]
]

{ #category : #media }
WALinkElement >> addAll [
	self addMedia: 'all'
]

{ #category : #media }
WALinkElement >> addAural [
	self addMedia: 'aural'
]

{ #category : #media }
WALinkElement >> addBraille [
	self addMedia: 'braille'
]

{ #category : #media }
WALinkElement >> addHandheld [
	self addMedia: 'handheld'
]

{ #category : #media }
WALinkElement >> addMedia: aString [
	self attributes addMedia: aString
]

{ #category : #media }
WALinkElement >> addPrint [
	self addMedia: 'print'
]

{ #category : #media }
WALinkElement >> addProjection [
	self addMedia: 'projection'
]

{ #category : #media }
WALinkElement >> addScreen [
	self addMedia: 'screen'
]

{ #category : #media }
WALinkElement >> addTeletype [
	self addMedia: 'tty'
]

{ #category : #media }
WALinkElement >> addTelevision [
	self addMedia: 'tv'
]

{ #category : #relationship }
WALinkElement >> beAlternate [
	"Gives alternate representations of the current document."
	self relationship: 'alternate'
]

{ #category : #relationship }
WALinkElement >> beAlternateStylesheet [
	self relationship: 'alternate stylesheet'
]

{ #category : #relationship }
WALinkElement >> beAppendix [
	self relationship: 'appendix'
]

{ #category : #relationship }
WALinkElement >> beArchives [
	"Provides a link to a collection of records, documents, or other materials of historical interest."
	self relationship: 'archives'
]

{ #category : #type }
WALinkElement >> beAtom [
	self type: 'application/atom+xml' seasideMimeType
]

{ #category : #relationship }
WALinkElement >> beAuthor [
	"Gives a link to the current document's author."
	self relationship: 'author'
]

{ #category : #relationship }
WALinkElement >> beBookmark [
	self relationship: 'bookmark'
]

{ #category : #relationship }
WALinkElement >> beCanonical [
	"Used to specify a canonical URL."

	self relationship: 'canonical'
]

{ #category : #relationship }
WALinkElement >> beChapter [
	self relationship: 'chapter'
]

{ #category : #relationship }
WALinkElement >> beClossary [
	self relationship: 'lossary'
]

{ #category : #relationship }
WALinkElement >> beCopyright [
	self relationship: 'copyright'
]

{ #category : #type }
WALinkElement >> beCss [
	self type: WAMimeType textCss
]

{ #category : #relationship }
WALinkElement >> beFirst [
	"Indicates that the current document is a part of a series, and that the first document in the series is the referenced document."
	self relationship: 'first'
]

{ #category : #relationship }
WALinkElement >> beFontDefinition [
	self relationship: 'fontdef'
]

{ #category : #relationship }
WALinkElement >> beGlossary [
	self relationship: 'glossary'
]

{ #category : #relationship }
WALinkElement >> beHelp [
	self relationship: 'help'
]

{ #category : #relationship }
WALinkElement >> beIndex [
	self relationship: 'index'
]

{ #category : #relationship }
WALinkElement >> beLast [
	self relationship: 'last'
]

{ #category : #relationship }
WALinkElement >> beMicrosummary [
	"http://wiki.mozilla.org/Microsummaries"
	self relationship: 'microsummary'
]

{ #category : #relationship }
WALinkElement >> beNext [
	"Indicates that the current document is a part of a series, and that the next document in the series is the referenced document."
	self relationship: 'next'
]

{ #category : #relationship }
WALinkElement >> bePrevious [
	"Indicates that the current document is a part of a series, and that the previous document in the series is the referenced document."
	self relationship: 'previous'
]

{ #category : #type }
WALinkElement >> beRss [
	self type: 'application/rss+xml' seasideMimeType
]

{ #category : #relationship }
WALinkElement >> beSearch [
	"Gives a link to a resource that can be used to search through the current document and its related pages. "
	self relationship: 'search'
]

{ #category : #relationship }
WALinkElement >> beSection [
	self relationship: 'section'
]

{ #category : #relationship }
WALinkElement >> beShortcutIcon [
	self relationship: 'shortcut icon'
]

{ #category : #relationship }
WALinkElement >> beStart [
	"Refers to the first document in a collection of documents. This link type tells search engines which document is considered by the author to be the starting point of the collection."
	self relationship: 'start'
]

{ #category : #relationship }
WALinkElement >> beStylesheet [
	"Imports a stylesheet."
	self relationship: 'stylesheet'
]

{ #category : #relationship }
WALinkElement >> beSubsection [
	self relationship: 'subsection'
]

{ #category : #relationship }
WALinkElement >> beTableOfContents [
	self relationship: 'contents'
]

{ #category : #relationship }
WALinkElement >> beTop [
	self relationship: 'top'
]

{ #category : #relationship }
WALinkElement >> beUp [
	"Provides a link to a document giving the context for the current document."
	self relationship: 'up'
]

{ #category : #testing }
WALinkElement >> isClosed [
	^ children isEmptyOrNil
]

{ #category : #attributes }
WALinkElement >> media: aString [
	"This attribute specifies the intended destination medium for style information. It may be a single media descriptor or a comma-separated list. The default value for this attribute is 'screen'."
	self attributeAt: 'media' put: aString
]

{ #category : #attributes }
WALinkElement >> relationship: aString [
	"This attribute describes the relationship from the current document to the anchor specified by the href attribute. The value of this attribute is a space-separated list of link types."
	
	self attributes at: 'rel' append: aString
]

{ #category : #attributes }
WALinkElement >> reverse: aString [
	"This attribute is used to describe a reverse link from the anchor specified by the href attribute to the current document. The value of this attribute is a space-separated list of link types."
	self attributeAt: 'rev' put: aString
]

{ #category : #accessing }
WALinkElement >> tag [
	^ children isEmptyOrNil
		ifTrue: [ 'link' ]
		ifFalse: [ 'style' ]
]

{ #category : #attributes }
WALinkElement >> title: aString [
	self attributeAt: 'title' put: aString
]

{ #category : #attributes }
WALinkElement >> url: aString [
	self attributeAt: 'href' put: aString
]
