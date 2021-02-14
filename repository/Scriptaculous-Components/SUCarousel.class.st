Class {
	#name : #SUCarousel,
	#superclass : #SUNavigation,
	#instVars : [
		'elementExtent',
		'numVisible',
		'scrollInc',
		'offset',
		'navMargin',
		'elementMargin',
		'animationSpeed',
		'created'
	],
	#category : 'Scriptaculous-Components-Core'
}

{ #category : #accessing }
SUCarousel >> animationSpeed [
	^ animationSpeed
]

{ #category : #accessing }
SUCarousel >> animationSpeed: anObject [
	animationSpeed := anObject
]

{ #category : #private }
SUCarousel >> buttonStyle [
	^ self subclassResponsibility
]

{ #category : #'accessing-bounds' }
SUCarousel >> clipExtent [
	^ self subclassResponsibility
]

{ #category : #'accessing-bounds' }
SUCarousel >> componentExtent [
	^ self subclassResponsibility
]

{ #category : #accessing }
SUCarousel >> cssButton [
	^ self subclassResponsibility
]

{ #category : #accessing }
SUCarousel >> cssClass [
	^ 'carouselComponent'
]

{ #category : #accessing }
SUCarousel >> cssFloat [
	^ self subclassResponsibility
]

{ #category : #accessing }
SUCarousel >> cssOrientation [
	^ self subclassResponsibility
]

{ #category : #accessing }
SUCarousel >> elementExtent [
	^ elementExtent
]

{ #category : #accessing }
SUCarousel >> elementExtent: anObject [
	elementExtent := anObject
]

{ #category : #accessing }
SUCarousel >> elementHeight [
	^ elementExtent y
]

{ #category : #accessing }
SUCarousel >> elementMargin [
	^ elementMargin
]

{ #category : #accessing }
SUCarousel >> elementMargin: anObject [
	elementMargin := anObject
]

{ #category : #accessing }
SUCarousel >> elementSize [
	^ self subclassResponsibility
]

{ #category : #accessing }
SUCarousel >> elementSizeWithMargins [
	^ self elementSize + (2 * elementMargin)
]

{ #category : #accessing }
SUCarousel >> elementWidth [
	^ elementExtent x
]

{ #category : #initialization }
SUCarousel >> initialize [
	super initialize.
	numVisible := 5.
	elementExtent := Point x: 40 y: 40.
	elementMargin := 5.
	scrollInc := 5.
	animationSpeed := 0.5.
	navMargin := 12.
	offset := 1
]

{ #category : #accessing }
SUCarousel >> lastOffset [
	^ offset + numVisible - 1
]

{ #category : #private }
SUCarousel >> moveSizeX: anInteger [
	^ 0
]

{ #category : #private }
SUCarousel >> moveSizeY: anInteger [
	^ 0
]

{ #category : #accessing }
SUCarousel >> navMargin [
	^ navMargin
]

{ #category : #accessing }
SUCarousel >> navMargin: anObject [
	navMargin := anObject
]

{ #category : #private }
SUCarousel >> nextText [
	^ self subclassResponsibility
]

{ #category : #accessing }
SUCarousel >> numVisible [
	^ numVisible
]

{ #category : #accessing }
SUCarousel >> numVisible: anObject [
	numVisible := anObject
]

{ #category : #private }
SUCarousel >> prevText [
	^ self subclassResponsibility
]

{ #category : #rendering }
SUCarousel >> renderElement: element index: index on: html [ 
	| currentId |
	currentId := self 
		uid: 'head'
		at: index.
	html div
		id: currentId;
		class: 'carousel-element';
		class: self cssFloat;
		style: 'margin:' , elementMargin greaseString , 'px;height:' , self elementHeight greaseString , 'px;width:' , self elementWidth greaseString , 'px;';
		with: element
]

{ #category : #rendering }
SUCarousel >> renderNavElementsOn: html [ 
	html div
		class: self cssOrientation;
		id: uid;
		with: [ 
			self visibleItems keysAndValuesDo: [ :index :element | 
				self 
					renderElement: element
					index: index
					on: html ] ]
]

{ #category : #rendering }
SUCarousel >> renderNavigationOn: html [
	"reset offset for each full refresh"
	| theExtent clipExtent |
	offset := 1.
	created := self visibleItems.
	theExtent := self componentExtent.
	clipExtent := self clipExtent.
	html div
		class: self cssClass; 
		style: 'height:', theExtent y greaseString, 'px;width:', theExtent x greaseString ,'px' ;
		with: [
			self renderPreviousButtonOn: html.
			html div
				class: 'clip-region';
				class: self cssFloat;
				style: 'height:', clipExtent y greaseString, 'px;width:', clipExtent x greaseString ,'px' ;
				id: 'clip_', uid;
				with: [ self renderNavElementsOn: html ].
			self renderNextButtonOn: html ]
]

{ #category : #rendering }
SUCarousel >> renderNextButtonOn: html [
	html div
		id: uid, '_next';
		style: self buttonStyle;
		class: self cssButton;
		onClick: (html prototype evaluator
					callback: [ :script |
						self scriptMove: -1 for: uid on: script ];
						return: false);
		with: self nextText
]

{ #category : #rendering }
SUCarousel >> renderPreviousButtonOn: html [
	html div
		id: uid, '_prev';
		style: self buttonStyle;
		class: self cssButton;
		onClick: (html prototype evaluator
					callback: [ :script |
						self scriptMove: 1 for: uid on: script ];
						return: false);
		with: self prevText
		

]

{ #category : #scripting }
SUCarousel >> scriptMove: anInteger for: id on: script [
	"hide buttons to avoid clicks between move operation, works only for IE and firefox"
	
	| currentIndex nextIndex direction buttonId |
	currentIndex := self lastOffset. 
	anInteger = 1 
			ifTrue: [
				offset = 1 ifTrue: [ ^ self ].
				offset := offset - scrollInc.
				direction := '_prev' ]
			ifFalse: [ (offset + scrollInc abs) > (items size) ifTrue: [ ^ self ].
				direction := '_next'.
				offset := offset + scrollInc ].
	anInteger < 0 ifTrue: [
		nextIndex := (currentIndex + scrollInc) min: (items size).
		nextIndex > currentIndex ifTrue: [
		currentIndex + 1 to: nextIndex do: [ :idx |
			| anItem |
			anItem := items at: idx.
			(created includes: anItem) ifFalse: [
				created add: anItem.
				script prototype element
					id: (self uid: 'head' at: idx);
					then: (script prototype element
						id: (self uid: 'head' at: idx - 1);
						insertAfter: [ :html | 
							self renderElement: (items at: idx) index: idx on: html ]) ] ] ] ].
	buttonId := uid,direction.
	script prototype element
		id: buttonId;
		styleAt: 'visibility' put: 'hidden'.
	script scriptaculous effect id: id;
		duration: animationSpeed;
		y: (self moveSizeY: anInteger); x: (self moveSizeX: anInteger);
		move;
		onAfterFinish: (PTElement new id: buttonId; styleAt: 'visibility' put: 'visible')

]

{ #category : #accessing }
SUCarousel >> scrollInc [
	^ scrollInc
]

{ #category : #accessing }
SUCarousel >> scrollInc: anObject [
	scrollInc := anObject
]

{ #category : #accessing }
SUCarousel >> visibleItems [
	^ items copyFrom: offset to: (self lastOffset min: items size)
]
