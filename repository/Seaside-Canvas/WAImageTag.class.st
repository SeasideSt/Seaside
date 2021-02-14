"
The IMG element embeds an image in the current document at the location of the element's definition. The IMG element has no content; it is usually replaced inline by the image designated by the src attribute, the exception being for left or right-aligned images that are ""floated"" out of line.

The alt attribute specifies alternate text that is rendered when the image cannot be displayed (see below for information on how to specify alternate text ). User agents must render alternate text when they cannot support images, they cannot support a certain image type or when they are configured not to display images.

Seaside per default sets the alternate text to an empty string. This helps validation of the page.
"
Class {
	#name : #WAImageTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WAImageTag >> altText: aString [
	"The alt attribute provides a short description of the image."
	self attributes at: 'alt' put: aString
]

{ #category : #attributes }
WAImageTag >> height: anInteger [
	self attributes at: 'height' put: anInteger
]

{ #category : #initialization }
WAImageTag >> initialize [
	super initialize.
	self altText: ''
]

{ #category : #testing }
WAImageTag >> isClosed [
	^ true
]

{ #category : #'attributes-events' }
WAImageTag >> onLoadEnd: anObject [
	"Fired at img elements after a successful load."

	self document scriptGenerator
		event: 'loadend'
		do: anObject
		on: self
]

{ #category : #accessing }
WAImageTag >> resourceUrl: aString [
	self url: (canvas absoluteUrlForResource: aString)
]

{ #category : #initialization }
WAImageTag >> setParent: aBrush canvas: aCanvas [ 
	super 
		setParent: aBrush
		canvas: aCanvas.
	(aBrush isKindOf: WAImageMapTag) ifTrue: [ 
		"in case the parent is an image map we need to set this attribute"
		self attributes 
			at: 'ismap'
			put: true ]
]

{ #category : #attributes }
WAImageTag >> sourceSet: aString [
	"One or more image candidate strings, each separated from the next by a $, (U+002C) character.
	http://www.w3.org/html/wg/drafts/html/master/embedded-content.html#attr-picture-source-srcset"
	self attributes at: 'srcset' put: aString
]

{ #category : #accessing }
WAImageTag >> tag [
	^ 'img'
]

{ #category : #attributes }
WAImageTag >> url: aString [
	self attributes at: 'src' put: aString
]

{ #category : #attributes }
WAImageTag >> width: anInteger [
	self attributes at: 'width' put: anInteger
]
