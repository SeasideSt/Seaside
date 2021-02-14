"
WATableReport presents tabular data. A WATableReport contains a collections of objects, one per row, and a collection of WAReportColumns. The WAReportColumn objects are configured to produce the text for the table cell based on the each row object. Each column has a header and an optional column sum. The table can be sorted on a column by clicking its header, unless the column handles rendering on the canvas itself. A table can be given a set of html colors (rowColors), used to colors the rows to aid in viewing. 

For more information see:
	Example - WATableReportFunctionalTest (initialization code below)
	WATableReport Tutorial - http://www.cdshaffer.com/david/Seaside/WATableReport/index.html

Instance Variables:
	columns	<Collection of WAReportColumn>	Each WAReportColumn produces the text for each table cell in a column  
	isReversed	<Boolean>	true if the current sort column is to be sorted in reverse order
	rowColors	<Collection of String/Symbol>	Each element is a string for an html color, which is used as a background color for table rows
	rowPeriod	<Integer>	Each color in rowColors is used for rowPeriod consectutive rows before using the next row color.
	rows	<Collection of Object>	Each element of the collection provides the data for a row in the table.
	sortColumn	<WAValueHolder on WAReportColumn>	Column used to sort the the table rows

Example:
	WATableReport new
		rows: WAComponent allSubclasses asArray;
		columns: (OrderedCollection new
			add: (WAReportColumn
				selector: #fullName title: 'Name'
				onClick: [ :each | self inform: each description ]);
			add: ((WAReportColumn
				selector: #canBeRoot title: 'Can Be Root')
				sortBlock: [ :a :b | a ]);
			add: (WAReportColumn
				renderBlock: [ :each :html | html emphasis: each description ]
				title: 'Description');
			yourself);
		rowColors: #(lightblue lightyellow);
		rowPeriod: 1;
		yourself
"
Class {
	#name : #WATableReport,
	#superclass : #WACanvasWidget,
	#instVars : [
		'sortColumn',
		'isReversed',
		'columns',
		'rowPeriod',
		'rowColors',
		'rows'
	],
	#category : 'Seaside-Widgets-Components'
}

{ #category : #private }
WATableReport >> chooseRow: aRow column: aColumn [
	aColumn chooseRow: aRow
]

{ #category : #private }
WATableReport >> colorForRowNumber: aNumber [
	^ rowColors at: ((aNumber - 1 // rowPeriod) \\ rowColors size) + 1 ifAbsent: [ '#fff' ]
]

{ #category : #accessing }
WATableReport >> columns: anArray [
	columns := anArray
]

{ #category : #initialization }
WATableReport >> initialize [
	super initialize.
	isReversed := false.
	rows := #().
	columns := #().
	sortColumn := WAValueHolder new.
	rowColors := #('#fff' '#eee').
	rowPeriod := 1
]

{ #category : #testing }
WATableReport >> isReversed [
	^ isReversed
]

{ #category : #rendering }
WATableReport >> renderColumn: aColumn row: aRow on: html [
	| text |
	aColumn canRender ifTrue: [
		html tableData
			class: aColumn cssClass;
			with: [ aColumn renderValue: aRow on: html ].
		^ self ].
	text := aColumn textForRow: aRow.
	text isEmpty ifTrue: [ text := ' ' ].
	html tableData
		class: aColumn cssClass;
		with: [
			aColumn canChoose
				ifFalse: [ html text: text ]
				ifTrue: [
					html anchor
						callback: [ self chooseRow: aRow column: aColumn ];
						with: text ] ]
]

{ #category : #rendering }
WATableReport >> renderContentOn: html [
	html table: [
		html tableHead: [ self renderTableHeaderOn: html ].
		html tableFoot: [ self renderTableFooterOn: html ].
		html tableBody: [ self renderRowsOn: html ] ]
]

{ #category : #rendering }
WATableReport >> renderFooterForColumn: aColumn on: html [
	html tableData
		class: aColumn cssClass;
		with: (aColumn totalForRows: rows)
]

{ #category : #rendering }
WATableReport >> renderHeaderForColumn: aColumn on: html [
	html tableHeading
		class: aColumn cssClass;
		with: [
			aColumn canSort
				ifTrue: [
					html anchor
						callback: [ self sortColumn: aColumn ];
						with: aColumn title ]
				ifFalse: [ html text: aColumn title ] ]
]

{ #category : #rendering }
WATableReport >> renderRowNumber: index item: row on: html [
	html tableRow
		style: 'background-color: ' , (self colorForRowNumber: index);
		with: [
			columns do: [ :each |
				self renderColumn: each row: row on: html ] ]
]

{ #category : #rendering }
WATableReport >> renderRowsOn: html [ 
	self rows keysAndValuesDo: [ :index :row | 
		self renderRowNumber: index item: row on: html ]
]

{ #category : #rendering }
WATableReport >> renderTableFooterOn: html [
	html tableRow: [
		columns do: [ :each |
			self renderFooterForColumn: each on: html ] ]
]

{ #category : #rendering }
WATableReport >> renderTableHeaderOn: html [
	html tableRow: [
		columns do: [ :each |
			self renderHeaderForColumn: each on: html ] ]
]

{ #category : #'state variables' }
WATableReport >> reverse [
	isReversed := isReversed not
]

{ #category : #accessing }
WATableReport >> rowColors: colorArray [
	rowColors := colorArray
]

{ #category : #accessing }
WATableReport >> rowPeriod: aNumber [
	rowPeriod := aNumber
]

{ #category : #accessing }
WATableReport >> rows [
	| r |
	self sortColumn ifNil: [ ^ rows ].
	r := self sortColumn sortRows: rows.
	^ self isReversed
		ifTrue: [ r reverse ]
		ifFalse: [ r ]
]

{ #category : #accessing }
WATableReport >> rows: anArray [
	rows := anArray
]

{ #category : #'state variables' }
WATableReport >> sortColumn [
	^ sortColumn contents
]

{ #category : #'state variables' }
WATableReport >> sortColumn: anObject [
	isReversed := anObject = self sortColumn and: [ isReversed not ].
	sortColumn contents: anObject
]

{ #category : #hooks }
WATableReport >> states [
	^ Array with: sortColumn
]
