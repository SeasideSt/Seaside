"
Supported only on experimental Opera
http://people.opera.com/howcome/2007/video/

A video element represents a video or movie, with an alternate representation given by its contents.

http://www.whatwg.org/specs/web-apps/current-work/#video
http://lists.whatwg.org/pipermail/whatwg-whatwg.org/attachments/20070228/6a0cdddc/attachment.txt
"
Class {
	#name : #WAVideoTag,
	#superclass : #WAMediaElementTag,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WAVideoTag >> height: anInteger [
	"The videoHeight  DOM attribute must return the native height of the video in CSS pixels. In the absence of resolution information, user agents may assume that one pixel in the video corresponds to one CSS pixel."
	self attributeAt: 'height' put: anInteger
]

{ #category : #attributes }
WAVideoTag >> poster: aString [
	"The poster attribute gives the address of an image file that the user agent can show while no video data is available. The attribute, if present, must contain a valid non-empty URL potentially surrounded by spaces."
	self attributeAt: 'poster' put: aString
]

{ #category : #accessing }
WAVideoTag >> tag [
	^ 'video'
]

{ #category : #attributes }
WAVideoTag >> width: anInteger [
	"The videoWidth DOM attribute must return the native width of the video in CSS pixels. In the absence of resolution information, user agents may assume that one pixel in the video corresponds to one CSS pixel."
	self attributeAt: 'width' put: anInteger
]
