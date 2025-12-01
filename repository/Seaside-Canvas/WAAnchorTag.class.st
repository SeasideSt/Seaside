"
I'm the class responsible for adding anchors (links) to your webpage. There are multiple ways of using me.

1. In the following case, the method #doSomethingOnClick will be sent to self when the user click on the anchor 'Click here to do something':

	html anchor
		callback: [ self doSomethingOnClick ];
		with: 'Click here to do something'.
		
The following code is a shortcut to create an anchor. The executed action is #doSomethingOnClick and the text is 'Do Something On Click':

	html anchor
		on: #doSomethingOnClick of: self

2. In the following case, a link to an external resource will be generated:

	html anchor
		url: 'http://www.seaside.st';
		with: 'Visit the Seaside'
"
Class {
	#name : 'WAAnchorTag',
	#superclass : 'WATagBrush',
	#instVars : [
		'url'
	],
	#category : 'Seaside-Canvas-Tags',
	#package : 'Seaside-Canvas',
	#tag : 'Tags'
}

{ #category : 'callbacks' }
WAAnchorTag >> callback: aNiladicValuable [ 
	aNiladicValuable argumentCount > 0 ifTrue: [ GRInvalidArgumentCount signal: 'Anchors expect a niladic callback.' ].
	self url addField: (self storeCallback: (WAActionCallback on: aNiladicValuable))
]

{ #category : 'attributes' }
WAAnchorTag >> charset: aString [
	"This attribute specifies the character encoding of the resource designated by the link."
	self
		greaseDeprecatedApi: 'WAAnchorTag>>charset:'
		details: 'Use an HTTP Content-Type header on the linked resource instead. https://www.geeksforgeeks.org/what-are-the-html-tags-that-deprecated-in-html5/'.	
	self attributes at: 'charset' put: aString
]

{ #category : 'url' }
WAAnchorTag >> extraParameters: aString [
	self url addField: aString
]

{ #category : 'url' }
WAAnchorTag >> extraPath: aString [
	self url addToPath: aString
]

{ #category : 'url' }
WAAnchorTag >> fragment: aString [
	self url fragment: aString
]

{ #category : 'attributes' }
WAAnchorTag >> media: aString [
	"This attribute specifies the intended destination medium for style information. It may be a single media descriptor or a comma-separated list. The default value for this attribute is 'screen'."
	self attributeAt: 'media' put: aString
]

{ #category : 'attributes' }
WAAnchorTag >> name: aString [
	"This attribute names the current anchor so that it may be the destination of another link. The value of this attribute must be a unique anchor name. The scope of this name is the current document. Note that this attribute shares the same name space as the id attribute."
	self
		greaseDeprecatedApi: 'WAAnchorTag>>name:'
		details: 'Use the id attribute instead. https://www.geeksforgeeks.org/what-are-the-html-tags-that-deprecated-in-html5/'.	
	self attributes at: 'name' put: aString
]

{ #category : 'public' }
WAAnchorTag >> navigation [
	"Makes the receiving anchor a purely navigational link, this is it won't redirect after processing the callbacks but directly process with the render phase. Don't use this feature if you change your model in the callback'."

	self url addField: '_n'
]

{ #category : 'callbacks' }
WAAnchorTag >> on: aSymbol of: anObject [ 
	self callback: (GRDelayedSend 
			receiver: anObject
			selector: aSymbol).
	self with: (self 
			labelForSelector: aSymbol
			of: anObject)
]

{ #category : 'attributes' }
WAAnchorTag >> relationship: aString [
	"This attribute describes the relationship from the current document to the anchor specified by the href attribute. The value of this attribute is a space-separated list of link types."
	
	self attributes at: 'rel' append: aString
]

{ #category : 'url' }
WAAnchorTag >> resourceUrl: aString [
	self url: (canvas absoluteUrlForResource: aString)
]

{ #category : 'attributes' }
WAAnchorTag >> reverse: aString [
	"This attribute is used to describe a reverse link from the anchor specified by the href attribute to the current document. The value of this attribute is a space-separated list of link types."
	self
		greaseDeprecatedApi: 'WAAnchorTag>>reverse:'
		details: 'Use the rel attribute. https://www.geeksforgeeks.org/what-are-the-html-tags-that-deprecated-in-html5/'.		
	self attributes at: 'rev' append: aString
]

{ #category : 'accessing' }
WAAnchorTag >> tag [
	^ 'a'
]

{ #category : 'attributes' }
WAAnchorTag >> target: aString [ 
	"This attribute specifies the name of a frame where a document is to be opened."
	
	self attributes at: 'target' put: aString
]

{ #category : 'target' }
WAAnchorTag >> targetBlank [
	"Load the URL into a new browsing context. This is usually a tab, but users can configure browsers to use new windows instead.
	
	WARNING:
	Use with parcimonie. It goes against web development best practices to force the user to open the link in a new tab. Usually your should let the user decide how he wants to open a link.
	
	Linking to another page using target=""_blank"" will run the new page on the same process as your page. If the new page is executing expensive JS, your page's performance may suffer. To avoid this use rel=""noopener""."

	self target: '_blank'
]

{ #category : 'target' }
WAAnchorTag >> targetParent [
	"Load the URL into the parent browsing context of the current one. If there is no parent, this behaves the same way as _self."

	self target: '_parent'
]

{ #category : 'target' }
WAAnchorTag >> targetSelf [
	"Load the URL into the same browsing context as the current one. This is the default behavior."

	self target: '_self'
]

{ #category : 'target' }
WAAnchorTag >> targetTop [
	" Load the URL into the top-level browsing context (that is, the «highest» browsing context that is an ancestor of the current one, and has no parent). If there is no parent, this behaves the same way as _self."

	self target: '_top'
]

{ #category : 'attributes' }
WAAnchorTag >> type: aString [
	"This attribute gives an advisory hint as to the content type of the content available at the link target address. It allows user agents to opt to use a fallback mechanism rather than fetch the content if they are advised that they will get content in a content type they do not support."
	
	self attributes at: 'type' put: aString
]

{ #category : 'accessing' }
WAAnchorTag >> url [
	^ url ifNil: [ url := canvas actionUrl copy ]
]

{ #category : 'accessing' }
WAAnchorTag >> url: aUrlOrString [
	url := aUrlOrString
]

{ #category : 'public' }
WAAnchorTag >> useBaseUrl [
	"Instead of using the URL of the current page that has been modified through #updateUrl:, use the base URL."

	self url: canvas actionBaseUrl copy
]

{ #category : 'public' }
WAAnchorTag >> with: aBlock [
	url isNil
		ifFalse: [ self attributes at: 'href' put: url ].
	super with: aBlock
]
