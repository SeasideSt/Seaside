Class {
	#name : #SUNavigationCarousel,
	#superclass : #SUNavigation,
	#instVars : [
		'selected',
		'elementHeight',
		'visibleElements',
		'offset'
	],
	#category : 'Scriptaculous-Components-Core'
}

{ #category : #accessing }
SUNavigationCarousel >> cssClass [
	^ 'carousel'
]

{ #category : #accessing }
SUNavigationCarousel >> elementHeight [
	"Answer the value of elementHeight"

	^ elementHeight
]

{ #category : #accessing }
SUNavigationCarousel >> elementHeight: anObject [
	"Set the value of elementHeight"

	elementHeight := anObject
]

{ #category : #initialization }
SUNavigationCarousel >> initialize [
	super initialize.
	visibleElements := 5.
	elementHeight := 14.
	offset := 1
]

{ #category : #accessing }
SUNavigationCarousel >> innerHeight [
	^ elementHeight * visibleElements
]

{ #category : #rendering }
SUNavigationCarousel >> renderActionsForId: id on: html [
	html table style: 'width:100%;margin-top:10px'; with: [
		html tableRow: [
			html tableData class: 'action'; with: [
				html anchor onClick: ((html prototype evaluator)
								callback: [ :script | self scriptMove: 1 for: id on: script ]; return: false);
								with: 'Previous' ].
				html tableData style: 'width:100%'; with: [ html space ].
				html tableData class: 'action'; class: 'right'; with: [
					html anchor onClick: ((html prototype evaluator)
								callback: [ :script | self scriptMove: -1 for: id on: script ]; return: false);
								with: 'Next' ] ] ]
]

{ #category : #rendering }
SUNavigationCarousel >> renderBodyOn: html [
	html div
		id: (self uid: 'body' at: 0);
		class: 'body';
		with: self selected
]

{ #category : #rendering }
SUNavigationCarousel >> renderElement: element index: index on: html [ 
	| currentId |
	currentId := self 
		uid: 'head'
		at: index.
	html div
		id: currentId;
		class: 'active'
			if: self selected = element;
		style: 'height:' , self elementHeight greaseString , 'px';
		with: 
			[ html anchor
				onClick: (html prototype evaluator
						callback: 
							[ :script | 
							self 
								scriptSelected: element
								id: currentId
								on: script ];
						return: false);
				callback: [ self selected: element ];
				with: [ html div: element label ] ]
]

{ #category : #rendering }
SUNavigationCarousel >> renderNavElementsOn: html [ 
	| moveId |
	moveId := html nextId.
	html div
		class: 'nav';
		with: [
			html div
				style: 'height:' , self innerHeight greaseString , 'px';
				class: 'inner';
				with: [
					html div
						id: moveId;
						class: 'move';
						with: [ 
							items keysAndValuesDo: [ :index :element | 
								self 
									renderElement: element
									index: index
									on: html ] ] ].
			self 
				renderActionsForId: moveId
				on: html ]
]

{ #category : #rendering }
SUNavigationCarousel >> renderNavigationOn: html [
	"reset offset for each full refresh"
	offset := 1.
	html div 
		class: self cssClass;
		with: [
			html table: [
				html tableRow: [
					html tableData: [ self renderNavElementsOn: html ].
					html tableData
						verticalAlign: 'top';
						with: [ self renderBodyOn: html ] ] ] ]
]

{ #category : #scripting }
SUNavigationCarousel >> scriptMove: anInteger for: id on: script [
	| elementsToMove |
	elementsToMove := visibleElements - 1.
	anInteger = 1
		ifTrue: [ 
			offset = 1
				ifTrue: [ ^ self ].
			offset := offset - elementsToMove ]
		ifFalse: [ 
			offset + elementsToMove abs > items size
				ifTrue: [ ^ self ].
			offset := offset + elementsToMove ].
	script scriptaculous effect
		id: id;
		duration: 0.2;
		x: 0;
		y: self elementHeight * elementsToMove * anInteger;
		move
]

{ #category : #scripting }
SUNavigationCarousel >> scriptSelected: aComponent id: currentId on: aScript [
	aScript prototype element
		id: (self uid: 'head' at: (self findIndex: self selected ifAbsent: [ ]));
		removeClassName: 'active'.
	self selected: aComponent.
	aScript prototype element
		id: currentId;
		addClassName: 'active'.
	aScript prototype element
		id: (self uid: 'body' at: 0);
		update: self selected
]

{ #category : #accessing }
SUNavigationCarousel >> selected [
	^ selected ifNil: [ selected := items isEmpty ifFalse: [ items first ] ]
]

{ #category : #accessing }
SUNavigationCarousel >> selected: anElement [
	selected := anElement
]

{ #category : #accessing }
SUNavigationCarousel >> visible [
	selected ifNil: [ ^ #() ].
	^ Array with: selected
]

{ #category : #accessing }
SUNavigationCarousel >> visibleElements [
	"Answer the value of visibleElements"

	^ visibleElements
]

{ #category : #accessing }
SUNavigationCarousel >> visibleElements: anObject [
	"Set the value of visibleElements"

	visibleElements := anObject
]
