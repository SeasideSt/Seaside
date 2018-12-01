"
WAMediaElementTag is an abstract class for all the media elements providing common media attributes.
See: http://www.w3.org/TR/html5/video.html#media-element
"
Class {
	#name : #WAMediaElementTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WAMediaElementTag >> autoplay: aBoolean [
	"The autoplay attribute is a boolean attribute. When present, the user agent (as described in the algorithm described herein) will automatically begin playback of the media resource as soon as it can do so without stopping."
	self attributeAt: 'autoplay' put: aBoolean
]

{ #category : #attributes }
WAMediaElementTag >> controls: aBoolean [
	"The controls attribute is a boolean attribute. If present, it indicates that the author has not provided a scripted controller and would like the user agent to provide its own set of controls."
	self attributeAt: 'controls' put: aBoolean
]

{ #category : #attributes }
WAMediaElementTag >> loop: aBoolean [
	"The loop attribute is a boolean attribute that, if specified, indicates that the media element is to seek back to the start of the media resource upon reaching the end."
	self attributeAt: 'loop' put: aBoolean
]

{ #category : #attributes }
WAMediaElementTag >> preload: aString [
	"The preload attribute is intended to provide a hint to the user agent about what the author thinks will lead to the best user experience.
	See: http://www.w3.org/TR/html5/video.html#attr-media-preload
	
	The preload attribute can have one of three values: 'none', 'metadata', 'auto'.
	Providing an empty string defaults the value of the attribute to be 'auto'."
	self attributeAt: 'preload' put: aString
]

{ #category : #attributes }
WAMediaElementTag >> url: aString [
	self attributeAt: 'src' put: aString
]
