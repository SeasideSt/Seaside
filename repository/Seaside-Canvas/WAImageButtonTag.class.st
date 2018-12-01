"
Creates a graphical submit button. The value of the src attribute specifies the URI of the image that will decorate the button. For accessibility reasons, authors should provide alternate text for the image via the alt attribute. 

When a pointing device is used to click on the image, the form is submitted and the click coordinates passed to the server. The x value is measured in pixels from the left of the image, and the y value in pixels from the top of the image. The submitted data includes name.x=x-value and name.y=y-value where ""name"" is the value of the name attribute, and x-value and y-value are the x and y coordinate values, respectively.
"
Class {
	#name : #WAImageButtonTag,
	#superclass : #WASubmitButtonTag,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #callbacks }
WAImageButtonTag >> callback: aBlock [
	self name: (self storeCallback: (WAImageCallback on: aBlock))
]

{ #category : #attributes }
WAImageButtonTag >> extent: aPoint [
	self width: aPoint x; height: aPoint y
]

{ #category : #attributes }
WAImageButtonTag >> height: aNumber [
	self attributes at: 'height' put: aNumber
]

{ #category : #accessing }
WAImageButtonTag >> resourceUrl: aString [
	self url: (canvas absoluteUrlForResource: aString)
]

{ #category : #accessing }
WAImageButtonTag >> type [
	^ 'image'
]

{ #category : #attributes }
WAImageButtonTag >> url: aString [
	self attributes at: 'src' put: aString
]

{ #category : #attributes }
WAImageButtonTag >> width: aNumber [
	self attributes at: 'width' put: aNumber
]
