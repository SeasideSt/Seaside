Class {
	#name : #WACollectionAttributeEditor,
	#superclass : #WAComponent,
	#instVars : [
		'configuration',
		'attribute',
		'selections',
		'selectionsCurrent'
	],
	#category : 'Seaside-Tools-Web'
}

{ #category : #actions }
WACollectionAttributeEditor >> add [
	| currentValues filtered |
	currentValues := self currentValues.
	filtered := selections
		reject: [ :each | currentValues includes: (self valueForOption: each) ];
		collect: [ :each | self valueForOption: each ].
	self isOverride
		ifTrue: [ self expression value: self expression value, filtered ]
		ifFalse: [ 
			self isModify
				ifTrue: [ self expression additions: self expression additions, filtered ] ].
	selectionsCurrent := self currentList select: [ :each |
		filtered includes: each value ]
]

{ #category : #actions }
WACollectionAttributeEditor >> addToRemovals [
	self expression removals: self expression removals , (self selectedInherited 
		reject: [ :each | self expression removals includes: each ])
]

{ #category : #accessing }
WACollectionAttributeEditor >> additions [
	^ (self currentList select: [ :each | each key = #add ]) collect: [ :assoc | assoc value ]
]

{ #category : #accessing }
WACollectionAttributeEditor >> attribute [
	^ attribute
]

{ #category : #accessing }
WACollectionAttributeEditor >> attribute: anObject [
	attribute := anObject
]

{ #category : #actions }
WACollectionAttributeEditor >> clear [
	self configuration removeExpressionAt: attribute key
]

{ #category : #accessing }
WACollectionAttributeEditor >> configuration [
	^ configuration
]

{ #category : #accessing }
WACollectionAttributeEditor >> configuration: anObject [
	configuration := anObject
]

{ #category : #accessing }
WACollectionAttributeEditor >> currentList [
	^ configuration currentCollectionAt: attribute key
]

{ #category : #accessing }
WACollectionAttributeEditor >> currentValues [
	^ self currentList collect: [ :each | each value ]
]

{ #category : #accessing }
WACollectionAttributeEditor >> expression [
	^ self configuration expressionAt: attribute key ifAbsent: [ nil ]
]

{ #category : #accessing }
WACollectionAttributeEditor >> fullList [
	^ attribute options
]

{ #category : #initialization }
WACollectionAttributeEditor >> initialize [ 
	super initialize.
	selections := #().
	selectionsCurrent := #()
]

{ #category : #accessing }
WACollectionAttributeEditor >> isModify [
	^ self expression notNil and: [ self isOverride not ]
]

{ #category : #accessing }
WACollectionAttributeEditor >> isOverride [
	^ self expression isKindOf: WAValueExpression
]

{ #category : #accessing }
WACollectionAttributeEditor >> isWriteable [
	^ self isOverride or: [ self isModify ]
]

{ #category : #actions }
WACollectionAttributeEditor >> modify [
	self configuration at: attribute key addAll: #() removeAll: #()
]

{ #category : #actions }
WACollectionAttributeEditor >> moveDown [
	self isModify
		ifTrue: [ self expression additions: (self moveDown: self selectedAdditions using: self expression additions) ]
		ifFalse: [ 
			self isOverride
				ifTrue: [ self expression value: (self moveDown: self selectionsCurrent using: self expression value) ] ]
]

{ #category : #private }
WACollectionAttributeEditor >> moveDown: aSelectedCollection using: aCollection [
	| index |
	aSelectedCollection reverse do: [ :each | 
		index := aCollection indexOf: each ifAbsent: [ aCollection size ].
		index < aCollection size
			ifTrue: [ aCollection swap: index with: index + 1 ] ].
	^ aCollection
]

{ #category : #actions }
WACollectionAttributeEditor >> moveUp [
	self isModify
		ifTrue: [ self expression additions: (self moveUp: self selectedAdditions using: self expression additions) ]
		ifFalse: [ 
			self isOverride
				ifTrue: [ self expression value: (self moveUp: self selectionsCurrent using: self expression value) ] ]
]

{ #category : #private }
WACollectionAttributeEditor >> moveUp: aSelectedCollection using: aCollection [
	| index |
	aSelectedCollection do: [ :each |
		index := aCollection indexOf: each ifAbsent: [ 0 ].
		index > 1 
			ifTrue: [ aCollection swap: index with: index - 1 ] ].
	^ aCollection
]

{ #category : #private }
WACollectionAttributeEditor >> optionForValue: anObject [
	^ anObject
]

{ #category : #actions }
WACollectionAttributeEditor >> override [
	self configuration
		takeValue: (self configuration at: attribute key)
		forAttribute: attribute
]

{ #category : #accessing }
WACollectionAttributeEditor >> removals [
	^ self currentList select: [ :each | each key = #remove ]
]

{ #category : #actions }
WACollectionAttributeEditor >> remove [
	self isOverride
		ifTrue: [
			self expression value isEmpty
				ifTrue: [ self expression value: self selectionsCurrent ]
				ifFalse: [ self expression value: (self removeAll: self selectionsCurrent from: self expression value) ] ]
		ifFalse: [
			self isModify
				ifTrue: [ self expression additions: (self removeAll: self selectedAdditions from: self expression additions) ] ]
]

{ #category : #private }
WACollectionAttributeEditor >> removeAll: aRemoveCollection from: aCollection [
	^ aCollection reject: [ :each |
		aRemoveCollection includes: each ]
]

{ #category : #actions }
WACollectionAttributeEditor >> removeFromRemovals [
	self expression removals: (self 
		removeAll: self selectedRemovals 
		from: self expression removals)
]

{ #category : #rendering }
WACollectionAttributeEditor >> renderActionsOn: html [
	(self isOverride or: [ self isModify ])
		ifTrue: [
			html anchor
				title: 'Clear override';
				onClick: 'return submitForm(this)';
				callback: [ self clear ];
				with: 'Clear'.
			self isModify
				ifTrue: [ html space. self renderAddToRemovalOn: html ] ]
		ifFalse: [
			html anchor
				title: 'Override inherited values';
				onClick: 'return submitForm(this)';
				callback: [ self override ];
				with: 'Override'.
			html space.
			html anchor
				title: 'Define Additions and / or removals';
				onClick: 'return submitForm(this)';
				callback: [ self modify ];
				with: 'Modify' ]
]

{ #category : #rendering }
WACollectionAttributeEditor >> renderAddToRemovalOn: html [
	html anchor
		title: 'Add selected inherited elements to the removal list';
		onClick: 'return submitForm(this)';
		callback: [ self addToRemovals ];
		with: 'Remove inherited'.
	html space: 2.
	html anchor
		title: 'Remove selected elements from the removal list';
		onClick: 'return submitForm(this)';
		callback: [ self removeFromRemovals ];
		with: 'Undo Remove inherited'
]

{ #category : #rendering }
WACollectionAttributeEditor >> renderContentOn: html [ 
	| currentList fullList listSize |
	fullList := self fullList.
	listSize := (fullList size min: 30) max: 5.
	html div
		class: 'groupContent';
		with: [
			html heading
				level2;
				with: 'Configure attribute: ' , attribute key.
			html form: [
				self renderActionsOn: html.
				html paragraph.
				html table: [
					html tableRow: [
						html tableData
							verticalAlign: 'top';
							with: [
								html label: 'Available'.
								html break.
								html multiSelect
									list: fullList;
									selected: selections;
									size: listSize;
									callback: [ :v | self selections: v ] ].
						html tableData
							verticalAlign: 'middle';
							with: [ self renderMoveActionsOn: html ].
						html tableData
							verticalAlign: 'top';
							with: [
								html label: 'Current'.
								html break.
								currentList := self currentList.
								currentList isEmpty 
									ifTrue: [ html text: '(empty)' ]
									ifFalse: [
										html multiSelect
											list: currentList;
											disabled: self isWriteable not;
											selected: selectionsCurrent;
											labels: [ :each | (self optionForValue: each value) greaseString, ' [', each key greaseString, ']' ];
											size: listSize;
											callback: [ :v | self selectionsCurrent: v ] ] ].
						html tableData
							verticalAlign: 'middle';
							with: [ self renderMoveUpAndDownOn: html ] ] ].
				html submitButton
					callback: [ self answer ];
					with: 'OK' ] ]
]

{ #category : #rendering }
WACollectionAttributeEditor >> renderMoveActionsOn: html [
	self isWriteable 
		ifTrue: [	
			html anchor
				title: 'Add to list';
				onClick: 'return submitForm(this)';
				callback: [ self add ];
				with: [ html html: '&rarr;' ].
			html break; break. 
			html anchor
				title: 'Remove from list';
				onClick: 'return submitForm(this)';
				callback: [ self remove ];
				with: [ html html: '&larr;' ] ]
		ifFalse: [ html space: 5 ]

]

{ #category : #rendering }
WACollectionAttributeEditor >> renderMoveUpAndDownOn: html [
	(self isWriteable and: [ self currentList isEmpty not ]) ifTrue: [
		html anchor
			title: 'Move selected element up';
			onClick: 'return submitForm(this)';
			callback: [ self moveUp ];
			with: [ html html: '&uarr;' ].
			html break; break. 
			html anchor
				title: 'Move selected element down';
			onClick: 'return submitForm(this)';
			callback: [ self moveDown ];
			with: [ html html: '&darr;' ] ]
]

{ #category : #accessing }
WACollectionAttributeEditor >> selectedAdditions [
	^ (selectionsCurrent select: [ :each | each key = #add ]) collect: [ :assoc | assoc value ]
]

{ #category : #accessing }
WACollectionAttributeEditor >> selectedInherited [
	^ (selectionsCurrent select: [ :each | each key = #inherited ]) collect: [ :assoc | assoc value ]
]

{ #category : #accessing }
WACollectionAttributeEditor >> selectedRemovals [
	^ (selectionsCurrent select: [ :each | each key = #remove ]) collect: [ :assoc | assoc value ]
]

{ #category : #accessing }
WACollectionAttributeEditor >> selections [
	^ selections
]

{ #category : #accessing }
WACollectionAttributeEditor >> selections: anArray [
	selections := anArray
]

{ #category : #accessing }
WACollectionAttributeEditor >> selectionsCurrent [
	^ selectionsCurrent collect: [ :each | each value ]
]

{ #category : #accessing }
WACollectionAttributeEditor >> selectionsCurrent: aColl [
	selectionsCurrent := aColl
]

{ #category : #private }
WACollectionAttributeEditor >> valueForOption: anObject [
	^ anObject
]
