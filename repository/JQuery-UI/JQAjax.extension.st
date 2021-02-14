Extension { #name : #JQAjax }

{ #category : #'*JQuery-UI-private' }
JQAjax >> callback: aBlock forEvent: anArraySpec [
	self 
		callback: [ :value | aBlock value: (self smalltalkForEvent: anArraySpec value: value) ]
		value: (self javascriptForEvent: anArraySpec)
]

{ #category : #'*JQuery-UI' }
JQAjax >> callback: aBlock passengers: aQuery [
	"Trigger the callback aBlock with the passengers of aQuery. Nodes that have no passenger are ignored."

	self
		callback: [ :value | 
			aBlock value: ((GRPlatform subStringsIn: value value splitBy: $,
				collect: [ :each | self renderContext callbacks passengerAt: each ])
				reject: [ :each | each isNil ]) ]
		value: (JSStream on: JQuery functionName , '.map(' , aQuery greaseString , '.get(),function(each){return each.id}).join(",")')
]

{ #category : #'*JQuery-UI' }
JQAjax >> callbackAccordion: aBlock [
	"Trigger aBlock with the accordion event object."
	
	self callback: aBlock forEvent: #(
		(passenger newHeader "activated header")
		(passenger oldHeader "previous header")
		(passenger newContent "activated content")
		(passenger oldContent "previous content"))
]

{ #category : #'*JQuery-UI' }
JQAjax >> callbackDraggable: aBlock [
	"Trigger aBlock with the draggable event object."
	
	self callback: aBlock forEvent: #(
		(passenger helper "the helper that's being dragged")
		(position position "current position of the helper")
		(position offset "current absolute position of the helper"))
]

{ #category : #'*JQuery-UI' }
JQAjax >> callbackDroppable: aBlock [
	"Trigger aBlock with the droppable event object."
	
	self callback: aBlock forEvent: #(
		(passenger draggable "current draggable element")
		(passenger helper "current draggable helper")
		(position position "current position of the draggable helper")
		(position offset "current absolute position of the draggable helper"))
]

{ #category : #'*JQuery-UI' }
JQAjax >> callbackResizable: aBlock [
	"Trigger aBlock with the resizeable event object."
	
	self callback: aBlock forEvent: #(
		(passenger helper "the helper element")
		(position originalPosition "position before resizing started") 
		(position position "current position")
		(size originalSize "size before resizing started")
		(size size "current size"))
]

{ #category : #'*JQuery-UI' }
JQAjax >> callbackSlider: aBlock [
	"Trigger aBlock with the slider event object."
	
	self callback: aBlock forEvent: #(
		(passenger handle "the current focused handle")
		(number value "the current handle's value"))
]

{ #category : #'*JQuery-UI' }
JQAjax >> callbackSortable: aBlock [
	"Trigger aBlock with the selectable event object."
	
	self callback: aBlock forEvent: #(
		(passenger helper "the current helper element")
		(passenger item " the current dragged element")
		(passenger placeholder "the placeholder")
		(passenger sender "the sortable where the item comes from")
		(position position "current position of the helper")
		(position offset "current absolute position of the helper"))
]

{ #category : #'*JQuery-UI' }
JQAjax >> callbackTabs: aBlock [
	"Trigger aBlock with the tabs event object."
	
	self callback: aBlock forEvent: #(
		(passenger tab "anchor element of the selected (clicked) tab")
		(passenger panel "element, that contains the selected/clicked tab contents")
		(number index "zero-based index of the selected (clicked) tab"))
]

{ #category : #'*JQuery-UI' }
JQAjax >> javascriptForEvent: anArraySpec [
	| stream |
	stream := JSStream new.
	anArraySpec
		do: [ :spec |
			(#(#number string) includes: spec first)
				ifTrue: [ stream nextPutAll: 'arguments[1].'; nextPutAll: spec second ].
			(spec first = #passenger)
				ifTrue: [ stream nextPutAll: JQuery functionName; nextPut: $(; nextPutAll: 'arguments[1].'; nextPutAll: spec second; nextPutAll: ').attr("id")' ].
			(spec first = #position)
				ifTrue: [ stream nextPutAll: 'arguments[1].'; nextPutAll: spec second; nextPutAll: '.top'; nextPutAll: '+","+'; nextPutAll: 'arguments[1].'; nextPutAll: spec second; nextPutAll: '.left' ].
			(spec first = #size)
				ifTrue: [ stream nextPutAll: 'arguments[1].'; nextPutAll: spec second; nextPutAll: '.width'; nextPutAll: '+","+'; nextPutAll: 'arguments[1].'; nextPutAll: spec second; nextPutAll: '.height' ] ]
		separatedBy: [ stream nextPutAll: '+","+' ].
	^ stream
]

{ #category : #'*JQuery-UI' }
JQAjax >> smalltalkForEvent: anArraySpec value: aString [
	| stream result |
	stream := aString readStream.
	result := GRSmallDictionary2 new.
	anArraySpec do: [ :spec |
		(spec first = #number)
			ifTrue: [ result at: spec last put: (stream upTo: $,) greaseInteger ].
		(spec first = #string)
				ifTrue: [ result at: spec last put: (stream upTo: $,) ].
		(spec first = #passenger)
			ifTrue: [ result at: spec last put: (self renderContext callbacks passengerAt: (stream upTo: $,)) ].
		(spec first = #position)
			ifTrue: [ result at: spec last put: (GRSmallDictionary2 new add: 'top' -> (stream upTo: $,) greaseInteger; add: 'left' -> (stream upTo: $,) greaseInteger; yourself) ].
		(spec first = #size)
			ifTrue: [ result at: spec last put: (stream upTo: $,) greaseInteger @ (stream upTo: $,) greaseInteger ] ].
	^ result
]
