"
WASelectionDateTable renders a table containing dates and rows. A user can select a continuous block of cells in the table.  The table contains one column for each date from startDate to endDate. The top row of the table groups columns by month and labels each month (January 2008). The second row contains the date of each month  (1-30) in the date range. The table also contains ""rows size"" rows. The first column of these rows contains the contents of the instance variable ""rows"". Rest of the cells contents are given by ""cellBlock"". 

Instance Variables:
	cellBlock	<BlockClosure [:rowIndex :date | ]>	returns text for the cell in row ""rowIndex"" and column for ""date""
	dateSelectionEnd	<Date>	last selected date
	dateSelectionStart	<Date>	first selected date
	rowSelectionEnd	<Integer>	index of last selected row
	rowSelectionStart	<Integer>	index of first selected row


"
Class {
	#name : #WASelectionDateTable,
	#superclass : #WADateTable,
	#instVars : [
		'cellBlock',
		'dateSelectionStart',
		'dateSelectionEnd',
		'rowSelectionStart',
		'rowSelectionEnd'
	],
	#category : 'Seaside-Widgets-Components'
}

{ #category : #selecting }
WASelectionDateTable >> clearSelection [
	dateSelectionStart := dateSelectionEnd := rowSelectionStart := rowSelectionEnd := nil
]

{ #category : #private }
WASelectionDateTable >> colorForDate: aDate rowIndex: aNumber [
	^ (self hasSelection and: [ self selectionContainsDate: aDate rowIndex: aNumber ])
		ifTrue: [ 'lightgrey' ]
		ifFalse: [ 'white' ]
]

{ #category : #accessing }
WASelectionDateTable >> endDate: aDate [
	self clearSelection.
	super endDate: aDate
]

{ #category : #private }
WASelectionDateTable >> endDateSelection [
	^ dateSelectionStart isNil
		ifFalse: [ dateSelectionStart max: dateSelectionEnd ]
]

{ #category : #private }
WASelectionDateTable >> endRow [
	^ rowSelectionStart max: rowSelectionEnd
]

{ #category : #private }
WASelectionDateTable >> endRowSelection [
	^ rowSelectionStart isNil
		ifFalse: [ rows at: (rowSelectionStart max: rowSelectionEnd) ]
]

{ #category : #testing }
WASelectionDateTable >> hasSelection [
	^ dateSelectionStart notNil
]

{ #category : #rendering }
WASelectionDateTable >> renderCellForDate: aDate row: anObject index: aNumber on: html [
	html tableData
		style: 'background-color: ', (self colorForDate: aDate rowIndex: aNumber);
		align: 'center';
		with: [
			html anchor
				callback: [ self selectDate: aDate rowIndex: aNumber ];
				with: (cellBlock value: anObject value: aDate) ]
]

{ #category : #accessing }
WASelectionDateTable >> rows: aCollection [
	self clearSelection.
	super rows: aCollection
]

{ #category : #private }
WASelectionDateTable >> rowsAndDatesDisplay: aBlock [
	cellBlock := aBlock
]

{ #category : #'editor access' }
WASelectionDateTable >> selectAll [
	dateSelectionStart := startDate.
	dateSelectionEnd := endDate.
	rowSelectionStart := 1.
	rowSelectionEnd := rows size
]

{ #category : #private }
WASelectionDateTable >> selectDate: aDate rowIndex: rowIndex [
	self hasSelection
		ifFalse: [ 
			dateSelectionStart := dateSelectionEnd := aDate.
			rowSelectionStart := rowSelectionEnd := rowIndex ]
		ifTrue: [ 
			dateSelectionEnd := aDate.
			rowSelectionEnd := rowIndex ]
]

{ #category : #private }
WASelectionDateTable >> selectedRows [
	^ rows copyFrom: self startRow to: self endRow
]

{ #category : #private }
WASelectionDateTable >> selectionContainsDate: aDate rowIndex: aNumber [
	^ ((aDate between: dateSelectionStart and: dateSelectionEnd)
		or: [ aDate between: dateSelectionEnd and: dateSelectionStart ])
		and: [ 
			(aNumber between: rowSelectionStart and: rowSelectionEnd)
				or: [ aNumber between: rowSelectionEnd and: rowSelectionStart ] ]
]

{ #category : #accessing }
WASelectionDateTable >> startDate: aDate [
	self clearSelection.
	super startDate: aDate
]

{ #category : #private }
WASelectionDateTable >> startDateSelection [
	^ dateSelectionStart isNil
		ifFalse: [ dateSelectionStart min: dateSelectionEnd ]
]

{ #category : #private }
WASelectionDateTable >> startRow [
	^ rowSelectionStart min: rowSelectionEnd
]

{ #category : #private }
WASelectionDateTable >> startRowSelection [
	^ rowSelectionStart isNil
		ifFalse: [ rows at: (rowSelectionStart min: rowSelectionEnd) ]
]
