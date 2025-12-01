Class {
	#name : 'WAScreenshot',
	#superclass : 'WAComponent',
	#instVars : [
		'button',
		'zoom'
	],
	#category : 'Seaside-Squeak-Tools-Web',
	#package : 'Seaside-Squeak-Tools-Web'
}

{ #category : 'testing' }
WAScreenshot class >> canBeRoot [
	^ true
]

{ #category : 'accessing' }
WAScreenshot class >> description [
	^ 'Pharo Screenshot'
]

{ #category : 'initialization' }
WAScreenshot class >> initialize [
	WAAdmin register: self asApplicationAt: 'tools/screenshot'
]

{ #category : 'accessing' }
WAScreenshot >> buttonCode [
	^ button = #red
		ifTrue: [ MouseEvent redButton ]
		ifFalse: [
			button = #blue
				ifTrue: [ MouseEvent blueButton ]
				ifFalse: [ MouseEvent yellowButton ] ]
]

{ #category : 'actions' }
WAScreenshot >> click: aPoint [
	"see EventSensor >> #createMouseEvent"
	| event |
	event := Array new: 8.
	event at: 1 put: 1.
	event at: 2 put: Time millisecondClockValue.
	event at: 3 put: aPoint x.
	event at: 4 put: aPoint y.
	event at: 5 put: self buttonCode.
	event at: 6 put: 0.
	self handleEvent: event.
	event at: 5 put: 0.
	self handleEvent: event.
	button := #red
]

{ #category : 'accessing' }
WAScreenshot >> form [
	^ zoom
		ifFalse: [ Display copy ]
		ifTrue: [ self topWindow imageForm ]
]

{ #category : 'actions' }
WAScreenshot >> handleEvent: anEvent [
	Sensor processEvent: anEvent
]

{ #category : 'initialization' }
WAScreenshot >> initialize [
	super initialize.
	button := #red.
	zoom := false
]

{ #category : 'accessing' }
WAScreenshot >> offset [
	^ zoom
		ifTrue: [ self topWindow position ]
		ifFalse: [ 0@0 ]
]

{ #category : 'rendering' }
WAScreenshot >> renderContentOn: html [
	html table: [
		html tableRow: [
			html tableData: [ self renderMouseButtonOn: html ].
			html tableData: [ self renderToggleZoomOn: html ].
			html tableData: [ self renderToggleUIProcessOn: html ] ] ].
	self renderMouseClickOn: html.
	html horizontalRule
]

{ #category : 'rendering' }
WAScreenshot >> renderMouseButtonOn: html [
	html form: [
		html table: [
			html tableRow: [
				| group |
				html tableData: 'Button: '.
				group := html radioGroup.
				group
					callback: [ :value | button := value ];
					selected: button.
				#(red yellow blue) do: [ :each |
					html tableData
						style: 'background-color: ', each;
						with: [
							group radioButton value: each ] ].
				html tableData: [
					html submitButton text: 'Set' ] ] ] ]
]

{ #category : 'rendering' }
WAScreenshot >> renderMouseClickOn: html [
	html div: [
		html map
			title: 'Click here';
			callback: [ :point | self click: point + self offset ];
			with: [
				| form |
				form := self form.
				html image
					width: (form width / Display uiScaleFactor) greaseInteger;	
					height: (form height / Display uiScaleFactor) greaseInteger;
					form: form ] ]

]

{ #category : 'rendering' }
WAScreenshot >> renderToggleUIProcessOn: html [
	html anchor
		callback: [ self toggleUIProcess ];
		with: self toggleUIText
]

{ #category : 'rendering' }
WAScreenshot >> renderToggleZoomOn: html [
	html anchor
		callback: [ self toggleZoom ];
		with: self toggleZoomText
]

{ #category : 'actions' }
WAScreenshot >> toggleUIProcess [
	| uiProcess |
	uiProcess := self uiProcess.
	uiProcess isSuspended
		ifTrue: [ uiProcess resume ]
		ifFalse: [ uiProcess suspend ]
]

{ #category : 'accessing' }
WAScreenshot >> toggleUIText [
	^ self uiProcess isSuspended
		ifFalse: [ 'Suspend UI Process' ]
		ifTrue: [ 'Resume UI Process' ]
]

{ #category : 'actions' }
WAScreenshot >> toggleZoom [
	zoom := zoom not
]

{ #category : 'accessing' }
WAScreenshot >> toggleZoomText [
	^ zoom
		ifTrue: [ 'Zoom out' ]
		ifFalse: [ 'Zoom in' ]
]

{ #category : 'accessing' }
WAScreenshot >> topWindow [
	^ SystemWindow classPool at: #TopWindow
]

{ #category : 'private' }
WAScreenshot >> uiProcess [
	^ Project current uiProcess
]
