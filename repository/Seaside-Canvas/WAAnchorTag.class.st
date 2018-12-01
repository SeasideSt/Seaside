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
	#name : #WAAnchorTag,
	#superclass : #WATagBrush,
	#instVars : [
		'url'
	],
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #callbacks }
WAAnchorTag >> callback: aNiladicValuable [ 
	aNiladicValuable argumentCount > 0 ifTrue: [ GRInvalidArgumentCount signal: 'Anchors expect a niladic callback.' ].
	self url addField: (self storeCallback: (WAActionCallback on: aNiladicValuable))
]

{ #category : #attributes }
WAAnchorTag >> charset: aString [
	"This attribute specifies the character encoding of the resource designated by the link."
	
	self attributes at: 'charset' put: aString
]

{ #category : #url }
WAAnchorTag >> extraParameters: aString [
	self url addField: aString
]

{ #category : #url }
WAAnchorTag >> extraPath: aString [
	self url addToPath: aString
]

{ #category : #url }
WAAnchorTag >> fragment: aString [
	self url fragment: aString
]

{ #category : #attributes }
WAAnchorTag >> media: aString [
	"This attribute specifies the intended destination medium for style information. It may be a single media descriptor or a comma-separated list. The default value for this attribute is 'screen'."
	self attributeAt: 'media' put: aString
]

{ #category : #attributes }
WAAnchorTag >> name: aString [
	"This attribute names the current anchor so that it may be the destination of another link. The value of this attribute must be a unique anchor name. The scope of this name is the current document. Note that this attribute shares the same name space as the id attribute."

	self attributes at: 'name' put: aString
]

{ #category : #public }
WAAnchorTag >> navigation [
	"Makes the receiving anchor a purely navigational link, this is it won't redirect after processing the callbacks but directly process with the render phase. Don't use this feature if you change your model in the callback'."

	self url addField: '_n'
]

{ #category : #callbacks }
WAAnchorTag >> on: aSymbol of: anObject [ 
	self callback: (GRDelayedSend 
			receiver: anObject
			selector: aSymbol).
	self with: (self 
			labelForSelector: aSymbol
			of: anObject)
]

{ #category : #attributes }
WAAnchorTag >> relationship: aString [
	"This attribute describes the relationship from the current document to the anchor specified by the href attribute. The value of this attribute is a space-separated list of link types."
	
	self attributes at: 'rel' append: aString
]

{ #category : #url }
WAAnchorTag >> resourceUrl: aString [
	self url: (canvas absoluteUrlForResource: aString)
]

{ #category : #attributes }
WAAnchorTag >> reverse: aString [
	"This attribute is used to describe a reverse link from the anchor specified by the href attribute to the current document. The value of this attribute is a space-separated list of link types."
	
	self attributes at: 'rev' append: aString
]

{ #category : #accessing }
WAAnchorTag >> tag [
	^ 'a'
]

{ #category : #attributes }
WAAnchorTag >> target: aString [ 
	"This attribute specifies the name of a frame where a document is to be opened."
	
	self attributes at: 'target' put: aString
]

{ #category : #attributes }
WAAnchorTag >> type: aString [
	"This attribute gives an advisory hint as to the content type of the content available at the link target address. It allows user agents to opt to use a fallback mechanism rather than fetch the content if they are advised that they will get content in a content type they do not support."
	
	self attributes at: 'type' put: aString
]

{ #category : #accessing }
WAAnchorTag >> url [
	^ url ifNil: [ url := canvas actionUrl copy ]
]

{ #category : #accessing }
WAAnchorTag >> url: aUrlOrString [
	url := aUrlOrString
]

{ #category : #public }
WAAnchorTag >> useBaseUrl [
	"Instead of using the URL of the current page that has been modified through #updateUrl:, use the base URL."

	self url: canvas actionBaseUrl copy
]

{ #category : #public }
WAAnchorTag >> with: aBlock [
	url isNil
		ifFalse: [ self attributes at: 'href' put: url ].
	super with: aBlock
]
