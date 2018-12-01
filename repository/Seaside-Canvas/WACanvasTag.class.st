"
supported on:
- Firefox 1.5
- Safari 2
- Opera 9

http://www.whatwg.org/specs/web-apps/current-work/#the-canvas
http://developer.mozilla.org/en/docs/Canvas_tutorial
"
Class {
	#name : #WACanvasTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WACanvasTag >> extent: aPoint [
	self width: aPoint x; height: aPoint y
]

{ #category : #attributes }
WACanvasTag >> height: aNumber [ 
	self 
		attributeAt: 'height'
		put: aNumber greaseString
]

{ #category : #accessing }
WACanvasTag >> tag [
	^ 'canvas'
]

{ #category : #attributes }
WACanvasTag >> width: aNumber [ 
	self 
		attributeAt: 'width'
		put: aNumber greaseString
]
