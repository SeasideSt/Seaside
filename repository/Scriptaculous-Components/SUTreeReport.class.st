Class {
	#name : #SUTreeReport,
	#superclass : #WAComponent,
	#instVars : [
		'uids',
		'roots',
		'columns',
		'expanded',
		'childrenBlock',
		'expandableBlock'
	],
	#category : 'Scriptaculous-Components-Core'
}

{ #category : #accessing }
SUTreeReport >> addColumn: aBlock label: aString [
	^ columns add: ((self treeReportColumnClass on: self)
		renderer: aBlock;
		label: aString;
		yourself)
]

{ #category : #accessing }
SUTreeReport >> children: aBlock [
	childrenBlock := aBlock
]

{ #category : #scripts }
SUTreeReport >> collapse: anObject level: anInteger on: aScript [
	self recursiveCollapse: anObject on: aScript.
	aScript prototype element
		down: '.indent a';
		removeClassName: 'expanded';
		id: (self uid: anObject on: aScript)
]

{ #category : #accessing }
SUTreeReport >> cssClass [
	^ 'treeReport'
]

{ #category : #accessing }
SUTreeReport >> expand: anObject [
	expanded add: anObject
]

{ #category : #scripts }
SUTreeReport >> expand: anObject level: anInteger on: aScript [
	| children parentId |
	children := childrenBlock value: anObject.
	children isEmpty ifTrue: [ ^ self ].
	parentId := self uid: anObject on: aScript.
	aScript prototype element
		id: parentId; 
		down: '.indent a';
		addClassName: 'expanded'.
	aScript prototype insertion
		id: parentId;
		after: [ :html | 
			children do: [ :each |
				self renderRow: each level: anInteger + 1 on: html ] ].
	expanded add: anObject
]

{ #category : #accessing }
SUTreeReport >> expandable: aBlock [
	expandableBlock := aBlock
]

{ #category : #initialization }
SUTreeReport >> initialize [
	super initialize.
	roots := OrderedCollection new.
	columns := OrderedCollection new.
	expanded := IdentitySet new.
	childrenBlock := [ :value | #() ].
	expandableBlock := [ :value | (childrenBlock value: value) notEmpty ]
]

{ #category : #testing }
SUTreeReport >> isExpandable: anObject [
	^ expandableBlock value: anObject
]

{ #category : #testing }
SUTreeReport >> isExpanded: anObject [
	^ expanded includes: anObject
]

{ #category : #private }
SUTreeReport >> recursiveCollapse: anObject on: aScript [
	expanded remove: anObject.
	(childrenBlock value: anObject) do: [ :each |
		aScript prototype element
			id: (self uid: each on: aScript);
			remove.
		(expanded includes: each)
			ifTrue: [ self recursiveCollapse: each on: aScript ] ]
]

{ #category : #rendering }
SUTreeReport >> renderBodyOn: html [
	"Render the body of the tree report."
	
	self renderRows: roots level: 0 on: html
]

{ #category : #rendering }
SUTreeReport >> renderContentOn: html [
	uids := IdentityDictionary new.
	html table 
		cellspacing: 0;
		class: self cssClass;
		with: [ self renderTableOn: html ]
]

{ #category : #rendering }
SUTreeReport >> renderHeadOn: html [
	"Display the column titles of the tree report."
	
	html tableRow: [
		columns do: [ :each | 
			html tableHeading: each label ] ]
]

{ #category : #rendering }
SUTreeReport >> renderRow: anObject level: anInteger on: html [
	"Render a specific row anObject at level anInteger."
	
	html tableRow id: (self uid: anObject on: html); with: [
		columns keysAndValuesDo: [ :index :each |
			html tableData: [
				index = 1 
					ifFalse: [ each render: anObject on: html ]
					ifTrue: [ each render: anObject indent: anInteger on: html ] ] ] ]
]

{ #category : #rendering }
SUTreeReport >> renderRowIndent: anObject level: anInteger on: html [
	anInteger timesRepeat: [ html div class: 'space' ].
	html div
		class: 'space';
		with: [ 
			(expandableBlock value: anObject) ifTrue: [ 
				html anchor
					class: 'expanded' if: (expanded includes: anObject);
					onClick: ((html prototype evaluator)
						callback: [ :script | self toggle: anObject level: anInteger on: script ];
						return: false) ] ]
]

{ #category : #rendering }
SUTreeReport >> renderRows: aCollection level: anInteger on: html [
	aCollection do: [ :each |
		self renderRow: each level: anInteger on: html.
		(expanded includes: each) ifTrue: [
			self 
				renderRows: (childrenBlock value: each)
				level: anInteger + 1 on: html ] ]
]

{ #category : #rendering }
SUTreeReport >> renderTableOn: html [
	html tableHead: [ self renderHeadOn: html ].
	html tableBody: [ self renderBodyOn: html ]
]

{ #category : #accessing }
SUTreeReport >> roots: aCollection [
	roots := aCollection
]

{ #category : #scripts }
SUTreeReport >> toggle: anObject level: anInteger on: aScript [
	(expanded includes: anObject)
		ifTrue: [ self collapse: anObject level: anInteger on: aScript ]
		ifFalse: [ self expand: anObject level: anInteger on: aScript ]
]

{ #category : #accessing }
SUTreeReport >> treeReportColumnClass [
	^ SUTreeReportColumn
]

{ #category : #private }
SUTreeReport >> uid: anObject on: html [
	^ uids at: anObject ifAbsentPut: [ html nextId ]
]
