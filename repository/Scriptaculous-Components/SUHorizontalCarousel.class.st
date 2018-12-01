Class {
	#name : #SUHorizontalCarousel,
	#superclass : #SUCarousel,
	#category : 'Scriptaculous-Components-Core'
}

{ #category : #private }
SUHorizontalCarousel >> buttonStyle [
	^ 'width:' , navMargin greaseString , 'px;line-height:' , self componentExtent y greaseString , 'px;'
]

{ #category : #'accessing-bounds' }
SUHorizontalCarousel >> clipExtent [
	| xSize ySize |
	xSize := elementExtent x + (2 * elementMargin).
	ySize := elementExtent y.
	^ Point x: numVisible * xSize y: ySize + (2 * elementMargin)
]

{ #category : #'accessing-bounds' }
SUHorizontalCarousel >> componentExtent [
	| clipExtent |
	clipExtent := self clipExtent.
	^ Point x: clipExtent x + (navMargin * 2) + 3 y: clipExtent y
]

{ #category : #accessing }
SUHorizontalCarousel >> cssButton [
	^ 'buttonh'
]

{ #category : #accessing }
SUHorizontalCarousel >> cssFloat [
	^ 'carousel-float-h'
]

{ #category : #accessing }
SUHorizontalCarousel >> cssOrientation [
	^ 'carousel-list-h'
]

{ #category : #accessing }
SUHorizontalCarousel >> elementSize [
	^ self elementExtent x
]

{ #category : #private }
SUHorizontalCarousel >> moveSizeX: anInteger [ 
	^ self elementSizeWithMargins * scrollInc * anInteger
]

{ #category : #private }
SUHorizontalCarousel >> nextText [
	^ '>'
]

{ #category : #private }
SUHorizontalCarousel >> prevText [
	^ '<'
]
