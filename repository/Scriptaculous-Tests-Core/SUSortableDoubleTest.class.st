Class {
	#name : #SUSortableDoubleTest,
	#superclass : #SUFunctionalTest,
	#instVars : [
		'left',
		'right'
	],
	#category : 'Scriptaculous-Tests-Core-Functional'
}

{ #category : #private }
SUSortableDoubleTest >> classForObject: anObject [
	^ anObject species = SmallInteger
		ifFalse: [ 'orange' ]
		ifTrue: [ 'green' ]
]

{ #category : #private }
SUSortableDoubleTest >> labelForObject: anObject [ 
	^ anObject class name , ': ' , anObject greaseString
]

{ #category : #accessing }
SUSortableDoubleTest >> left [
	^ left ifNil: [ left := #($a $b) ]
]

{ #category : #accessing }
SUSortableDoubleTest >> left: aCollection [
	left := aCollection
]

{ #category : #rendering }
SUSortableDoubleTest >> renderContentOn: html [
	html div
		style: 'float: left;';
		with: [ self renderList: #left titled: 'Left List' on: html ].
	html div
		style: 'float: left;';
		with: [ self renderList: #right titled: 'Right List' on: html ].
	html div
		style: 'clear: both'
]

{ #category : #rendering }
SUSortableDoubleTest >> renderList: aSelector titled: aString on: html [
	html heading level: 3; with: aString.
	html paragraph
		id: aSelector , 'status';
		with: [ self renderListModel: aSelector on: html ].
	self renderListItems: aSelector on: html
]

{ #category : #rendering }
SUSortableDoubleTest >> renderListItems: aSelector on: html [ 
	html unorderedList
		id: aSelector greaseString;
		style: 'width: 200px; min-height: 50px;';
		script: (html scriptaculous sortable
				constraint: false;
				dropOnEmpty: true;
				containment: #(#left #right );
				onUpdate: (html scriptaculous updater
						id: aSelector , 'status';
						triggerSortable: aSelector greaseString
							callback: 
								[ :values | 
								self 
									perform: aSelector asMutator
									with: values ];
						callback: 
							[ :renderer | 
							self 
								renderListModel: aSelector
								on: renderer ]));
		with: 
			[ (self perform: aSelector) do: 
				[ :each | 
				html listItem
					passenger: each;
					class: (self classForObject: each);
					with: (self labelForObject: each) ] ]
]

{ #category : #rendering }
SUSortableDoubleTest >> renderListModel: aSelector on: html [
	html text: 'Model: '.
	(self perform: aSelector)
		do: [ :each | html render: each ]
		separatedBy: [ html text: ', ' ]
]

{ #category : #accessing }
SUSortableDoubleTest >> right [
	^ right ifNil: [ right := #(1 2) ]
]

{ #category : #accessing }
SUSortableDoubleTest >> right: aCollection [
	right := aCollection
]

{ #category : #hooks }
SUSortableDoubleTest >> style [
	^ 'li.green, li.orange {
	margin: 4px;
	padding: 2px;
  	cursor: move;
}
li.green {
	background-color: #ecf3e1;
  	border: 1px solid #c5dea1;
}
li.orange {
	background-color: #fff4d8;
  	border: 1px solid #e8a400;
}'
]
