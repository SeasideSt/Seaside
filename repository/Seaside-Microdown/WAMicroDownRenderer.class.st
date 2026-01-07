Class {
	#name : 'WAMicroDownRenderer',
	#superclass : 'MicrodownVisitor',
	#instVars : [
		'canvas'
	],
	#category : 'Seaside-Microdown',
	#package : 'Seaside-Microdown'
}

{ #category : 'instance creation' }
WAMicroDownRenderer class >> on: aWAHtmlCanvas [

	^ self new canvas: aWAHtmlCanvas
]

{ #category : 'instance creation' }
WAMicroDownRenderer class >> on: aWAHtmlCanvas render: microDownString [

	^ (self new canvas: aWAHtmlCanvas) visit: (Microdown parse: microDownString)
]

{ #category : 'accessing' }
WAMicroDownRenderer >> canvas: aWAHtmlCanvas [

	canvas := aWAHtmlCanvas
]

{ #category : 'visiting' }
WAMicroDownRenderer >> visitHeader: aHeader [

	canvas heading
		level: aHeader level;
		with: [ super visitHeader: aHeader ]
]

{ #category : 'visiting - inline elements' }
WAMicroDownRenderer >> visitLink: aLink [

	canvas anchor
		url: aLink url;
		with: [ super visitLink: aLink ]
]

{ #category : 'visiting - list' }
WAMicroDownRenderer >> visitListItem: anItem [

	canvas listItem: [ super visitListItem: anItem ]
]

{ #category : 'visiting - list' }
WAMicroDownRenderer >> visitOrderedList: anOrderedList [

	canvas orderedList: [ super visitOrderedList: anOrderedList ]
]

{ #category : 'visiting' }
WAMicroDownRenderer >> visitParagraph: aParagraph [

	canvas paragraph: [ super visitParagraph: aParagraph ]
]

{ #category : 'visiting' }
WAMicroDownRenderer >> visitTable: aTable [

	canvas table: [ 
		aTable rows do: [ :row |
			canvas tableRow: [
				row do: [ :el |
					canvas tableData: [ el do: [ :some | some accept: self ] ] ] ] ] ]
]

{ #category : 'visiting - inline elements' }
WAMicroDownRenderer >> visitText: anInlineBlock [

	canvas text: anInlineBlock text
]

{ #category : 'visiting - list' }
WAMicroDownRenderer >> visitUnorderedList: anUnorderedList [

	canvas unorderedList: [ super visitUnorderedList: anUnorderedList ]
]
