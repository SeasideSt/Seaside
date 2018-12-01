Class {
	#name : #SUWindow,
	#superclass : #WAComponent,
	#instVars : [
		'title',
		'component',
		'id',
		'updateBlock',
		'componentBlock',
		'extent',
		'origin',
		'properties',
		'collapsed',
		'visible'
	],
	#category : 'Scriptaculous-Components-Core'
}

{ #category : #'instance creation' }
SUWindow class >> on: aBlock [
	^ self new
		componentBlock: aBlock;
		yourself
]

{ #category : #hooks }
SUWindow >> children [
	^ Array with: component
]

{ #category : #actions }
SUWindow >> close [
	visible := false
]

{ #category : #'accessing-properties' }
SUWindow >> closeButtonEnabled [
	^ self propertiesAt: #closeButton ifAbsent: [ true ]
]

{ #category : #'accessing-properties' }
SUWindow >> closeButtonEnabled: aBoolean [
	self propertiesAt: #closeButton put: aBoolean
]

{ #category : #scripting }
SUWindow >> closeOn: script [
	self close.
	script prototype element
		id: self componentId;
		remove.
	script scriptaculous effect
		id: self windowId;
		duration: 0.5; fade
]

{ #category : #scripting }
SUWindow >> collapseOn: script [
	collapsed 
		ifFalse: [
			script prototype element
				id: self windowId;
				styleAt: 'height' put: self titleHeight greaseString , 'px'.
			script prototype element
				id: self containerId; hide ]
		ifTrue: [
			script prototype element
				id: self windowId;
				styleAt: 'height' put: extent y greaseString, 'px'.
			script prototype element
				id: self containerId;
				show ].
	collapsed := collapsed not

]

{ #category : #accessing }
SUWindow >> collapsed [
	^ collapsed
]

{ #category : #accessing }
SUWindow >> collapsed: aBoolean [
	collapsed := aBoolean
]

{ #category : #accessing }
SUWindow >> component: aComponent [
	component := aComponent
]

{ #category : #accessing }
SUWindow >> componentBlock: aBlock [
	componentBlock := aBlock fixCallbackTemps
]

{ #category : #accessing }
SUWindow >> componentId [
	^ 'comp_' , self windowId
]

{ #category : #accessing }
SUWindow >> containerId [
	^ 'container_' , self windowId
]

{ #category : #accessing }
SUWindow >> cssClass [
	^ 'suWindow'
]

{ #category : #private }
SUWindow >> cssContainerExtent [
	^ 'width:' , extent x greaseString , 'px;height:' , (extent y - 16) greaseString , 'px;'
]

{ #category : #private }
SUWindow >> cssExtent [
	^ 'width:' , extent x greaseString , 'px;height:' , extent y greaseString , 'px;'
]

{ #category : #private }
SUWindow >> cssOrigin [
	^ 'left:' , origin x greaseString , 'px;top:' , origin y greaseString , 'px;'
]

{ #category : #accessing }
SUWindow >> extent: aPoint [
	extent := aPoint
]

{ #category : #accessing }
SUWindow >> id [
	^ id
]

{ #category : #accessing }
SUWindow >> id: aId [
	id := aId
]

{ #category : #initialization }
SUWindow >> initialize [
	super initialize.
	extent := 300 @ 200.
	origin := 100 @ 100.
	title := 'SU_Window'.
	componentBlock := [  ].
	collapsed := false.
	visible := false
]

{ #category : #testing }
SUWindow >> isVisible [
	^ visible
]

{ #category : #'accessing-properties' }
SUWindow >> minimizeButtonEnabled [
	^ self propertiesAt: #minimizeButton ifAbsent: [ true ]
]

{ #category : #'accessing-properties' }
SUWindow >> minimizeButtonEnabled: aBoolean [
	self propertiesAt: #minimizeButton put: aBoolean
]

{ #category : #scripting }
SUWindow >> openOn: aScript [ 
	self 
		openOn: aScript
		hidden: false
]

{ #category : #scripting }
SUWindow >> openOn: aScript hidden: aBoolean [
	self isVisible
		ifFalse: [
			visible := true.
			aBoolean ifFalse: [ self showOn: aScript ].
			aScript prototype element
				id: self windowId;
				styleAt: 'left' put: origin x greaseString, 'px';
				styleAt: 'top' put: origin y greaseString, 'px'.
			aScript prototype element
				id: self containerId;
				insert: [ :html |
					self setComponent.
					self renderComponentOn: html ] ]
]

{ #category : #accessing }
SUWindow >> origin: aPoint [
	origin := aPoint
]

{ #category : #public }
SUWindow >> originX: x y: y [
	self origin: (Point x: x asNumber y: y asNumber + 16)

]

{ #category : #accessing }
SUWindow >> properties [
	^ properties ifNil: [ properties := Dictionary new ]
]

{ #category : #accessing }
SUWindow >> propertiesAt: aKey [
	^ self properties at: aKey ifAbsent: [  ]
]

{ #category : #accessing }
SUWindow >> propertiesAt: aKey ifAbsent: aBlock [
	^ self properties at: aKey ifAbsent: aBlock
]

{ #category : #accessing }
SUWindow >> propertiesAt: aKey put: aValue [
	self properties at: aKey put: aValue
]

{ #category : #rendering }
SUWindow >> renderBodyOn: html [
	html div
		class: 'title';
		id: self titleId;
		with: [ self renderTitleOn: html ].
	html div
		class: 'container';
		style: self cssContainerExtent;
		id: self containerId

]

{ #category : #rendering }
SUWindow >> renderCloseOn: html [
	self closeButtonEnabled
		ifTrue: [ html anchor
					title: 'Close';
					onClick: (html prototype evaluator
								callback: [ :script |
									self closeOn: script ];
									return: false);
					with: 'X' ]
]

{ #category : #rendering }
SUWindow >> renderComponentOn: html [
	html div
		id: self componentId;
		with: component
]

{ #category : #rendering }
SUWindow >> renderContentOn: html [ 
	self close.
	collapsed := false.
	html div
		id: self windowId;
		script: (html scriptaculous draggable
				handle: self titleId;
				revert: false);
		class: self cssClass;
		style: 'display: none';
		style: 'z-index:' , self zIndex greaseString , ';' , self cssOrigin , self cssExtent;
		with: [ self renderBodyOn: html ]
]

{ #category : #rendering }
SUWindow >> renderMinimizeOn: html [
	self minimizeButtonEnabled
		ifTrue: [
			html anchor
					title: 'Minimize';
					onClick: (html prototype evaluator
									callback: [ :script | 
												self collapseOn: script ];
												return: false);
					with: '-' ]
]

{ #category : #rendering }
SUWindow >> renderTitleOn: html [
	html table
		class: 'title';
		style: 'width:100%';
		cellspacing: 0;
		cellpadding:0;
		with: [
			html tableRow: [
				html tableData
					style: 'width:100%';
					class: 'label';
					with: title.
				html tableData: [ self renderMinimizeOn: html ] .
				html tableData: [ self renderCloseOn: html ] ] ] 

]

{ #category : #private }
SUWindow >> setComponent [
	component isNil
		ifTrue: [ component := componentBlock value: self ].
	updateBlock notNil
		ifTrue: [ updateBlock value: self value: component ]
]

{ #category : #scripting }
SUWindow >> showOn: aScript [
	aScript scriptaculous effect id: self windowId; duration: 0.3; appear
]

{ #category : #accessing }
SUWindow >> title: aString [
	title := aString
]

{ #category : #accessing }
SUWindow >> titleHeight [
	^ 20
]

{ #category : #accessing }
SUWindow >> titleId [
	^ 'title_' , self windowId
]

{ #category : #'accessing-properties' }
SUWindow >> tooltipKey [
	^ self propertiesAt: #tooltipKey ifAbsent: [ #unknown ]
]

{ #category : #'accessing-properties' }
SUWindow >> tooltipKey: aKey [
	self propertiesAt: #tooltipKey put: aKey
]

{ #category : #accessing }
SUWindow >> updateBlock: aBlock [
	updateBlock := aBlock
]

{ #category : #accessing }
SUWindow >> windowId [
	^ id ifNil: [ id := 'suwindow' ]
]

{ #category : #accessing }
SUWindow >> zIndex [
	^ self propertiesAt: #zIndex ifAbsent: [ 999 ]
]

{ #category : #accessing }
SUWindow >> zIndex: anInteger [
	^ self propertiesAt: #zIndex put: anInteger
]
