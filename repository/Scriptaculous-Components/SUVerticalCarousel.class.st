Class {
	#name : #SUVerticalCarousel,
	#superclass : #SUCarousel,
	#category : 'Scriptaculous-Components-Core'
}

{ #category : #private }
SUVerticalCarousel >> buttonStyle [
	^ 'height:' , navMargin greaseString , 'px;'
]

{ #category : #'accessing-bounds' }
SUVerticalCarousel >> clipExtent [
	| xSize ySize |
	xSize := elementExtent x.
	ySize := elementExtent y + (2 * elementMargin).
	^ Point x: xSize + (2 * elementMargin) y: ySize * numVisible
]

{ #category : #'accessing-bounds' }
SUVerticalCarousel >> componentExtent [
	| clipExtent |
	clipExtent := self clipExtent.
	^ Point x: clipExtent x y: clipExtent y + (navMargin * 2) + 3
]

{ #category : #accessing }
SUVerticalCarousel >> cssButton [
	^ 'buttonv'
]

{ #category : #accessing }
SUVerticalCarousel >> cssFloat [
	^ 'carousel-float-v'
]

{ #category : #accessing }
SUVerticalCarousel >> cssOrientation [
	^ 'carousel-list-v'
]

{ #category : #accessing }
SUVerticalCarousel >> elementSize [
	^ self elementExtent y
]

{ #category : #private }
SUVerticalCarousel >> moveSizeY: anInteger [
	^ self elementSizeWithMargins * scrollInc * anInteger
]

{ #category : #private }
SUVerticalCarousel >> nextText [
	^ '\/'
]

{ #category : #private }
SUVerticalCarousel >> prevText [
	^ '/\'
]
