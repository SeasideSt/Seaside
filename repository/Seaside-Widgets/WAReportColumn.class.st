"
WAReportColumn displays a column, one cell at a time, of a WAReportTable. Columns can be sorted, have a title, can have a total, and its element can be links. The valueBlock obtains the output (an object) to display for each row from the row's object.  The formatBlock is used to convert the valueBlock output to a string. If you need html markup to display the result, use the two argument form of valueBlock. However, columns with two argument valueBlock can not be sorted. See class methods for shortcut methods for setting the value block. 

For more information see:
	WATableReport

Instance Variables:
	clickBlock	<BlockClosure [:rowObject | ]>	When clickBlock is set items in column will be anchors. clickBlock is called with the selected object when anchor is clicked on. Typically clickBlock calls a component which generates a new page.
	formatBlock	<BlockClosure [:object | ]>	Should convert the result of the one-argument valueBlock to the string to be displayed. If formatBlock is nil then  ""displayString"" is sent to the result of valueBlock for the display string for this column.  
	hasTotal	<Boolean>	If true the column will display the sum of all elements in the column, sum is displayed in the last row.
	sortBlock	<BlockClosure [:a :b | ]>	Used to sort the element in the column. Arguments are the value from the one argument valueBlock
	title	<String>	Column header 
	valueBlock	<BlockClosure [:rowObject | ] or [:rowObject :aWARenderCanvas |] >	
		[:rowObject | ] this form results in an object that is to be displayed in a column cell, argument is the object for a given row (see WATableReport)
		[:rowObject :aHtmlCanvas |] this form is to render the value for a column cell from rowObject directly on aWRenderCanvas
cssClass
	title <String> CSS class
	the CSS class assigned to the <td>-tag in this column 


"
Class {
	#name : #WAReportColumn,
	#superclass : #WAObject,
	#instVars : [
		'clickBlock',
		'formatBlock',
		'hasTotal',
		'title',
		'sortBlock',
		'valueBlock',
		'cssClass'
	],
	#category : 'Seaside-Widgets-Components'
}

{ #category : #'instance creation' }
WAReportColumn class >> renderBlock: aBlock title: aString [
	^ self new
		title: aString;
		valueBlock: aBlock;
		yourself
]

{ #category : #'instance creation' }
WAReportColumn class >> selector: aSymbol [
	^ self selector: aSymbol title: aSymbol capitalized
]

{ #category : #'instance creation' }
WAReportColumn class >> selector: aSymbol title: aString [
	^ self selector: aSymbol title: aString onClick: nil
]

{ #category : #'instance creation' }
WAReportColumn class >> selector: aSymbol title: aString onClick: aBlock [
	^ self new
		title: aString;
		selector: aSymbol;
		clickBlock: aBlock;
		yourself
]

{ #category : #public }
WAReportColumn >> canChoose [
	^ clickBlock notNil
]

{ #category : #rendering }
WAReportColumn >> canRender [
	^ valueBlock argumentCount > 1
]

{ #category : #public }
WAReportColumn >> canSort [
	^ self canRender not and: [ sortBlock notNil ]
]

{ #category : #public }
WAReportColumn >> chooseRow: row [
	^ clickBlock value: row
]

{ #category : #accessing }
WAReportColumn >> clickBlock: aBlock [
	clickBlock := aBlock
]

{ #category : #accessing }
WAReportColumn >> columnClickBlock: aBlock [
	self clickBlock: [ :r | aBlock value: (self valueForRow: r) ]
]

{ #category : #accessing }
WAReportColumn >> cssClass [
	^ cssClass
]

{ #category : #accessing }
WAReportColumn >> cssClass: aString [
	cssClass := aString
]

{ #category : #accessing }
WAReportColumn >> formatBlock: anObject [
	formatBlock := anObject
]

{ #category : #accessing }
WAReportColumn >> hasTotal: aBoolean [
	hasTotal := aBoolean
]

{ #category : #accessing }
WAReportColumn >> index: aNumber [
	valueBlock := [ :row | row at: aNumber ]
]

{ #category : #initialization }
WAReportColumn >> initialize [
	super initialize.
	formatBlock := [ :x | x greaseString ].
	sortBlock := [ :a :b | a <= b ].
	valueBlock := [ :row | nil ].
	clickBlock := nil.
	title := 'Untitled'.
	hasTotal := false
]

{ #category : #rendering }
WAReportColumn >> renderValue: anObject on: html [
	valueBlock value: anObject value: html
]

{ #category : #accessing }
WAReportColumn >> selector: aSymbol [
	valueBlock := [ :row | row perform: aSymbol ]
]

{ #category : #accessing }
WAReportColumn >> sortBlock: anObject [
	sortBlock := anObject
]

{ #category : #public }
WAReportColumn >> sortRows: anArray [
	| assocs |
	assocs := anArray collect: [ :ea | ea -> (self valueForRow: ea) ].
	assocs := assocs asSortedCollection: [ :a :b | sortBlock value: a value value: b value ].
	^ assocs collect: [ :ea | ea key ]
]

{ #category : #public }
WAReportColumn >> textForRow: row [
	^ formatBlock value: (self valueForRow: row)
]

{ #category : #public }
WAReportColumn >> title [
	^ title
]

{ #category : #accessing }
WAReportColumn >> title: aString [
	title := aString
]

{ #category : #public }
WAReportColumn >> totalForRows: aCollection [
	^ hasTotal
		ifFalse: [ '' ]
		ifTrue: [ formatBlock value: (aCollection inject: 0 into: [ :sum :r | sum + (self valueForRow: r) ]) ]
]

{ #category : #accessing }
WAReportColumn >> valueBlock: aBlock [
	valueBlock := aBlock
]

{ #category : #public }
WAReportColumn >> valueForRow: row [
	^ valueBlock value: row
]
