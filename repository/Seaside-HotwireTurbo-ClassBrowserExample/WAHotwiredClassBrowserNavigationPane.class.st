Class {
	#name : 'WAHotwiredClassBrowserNavigationPane',
	#superclass : 'WAComponent',
	#instVars : [
		'list',
		'selected',
		'elementsBlock',
		'labelsBlock',
		'onSelectBlock',
		'cssClass',
		'filterTerm'
	],
	#category : 'Seaside-HotwireTurbo-ClassBrowserExample',
	#package : 'Seaside-HotwireTurbo-ClassBrowserExample'
}

{ #category : 'as yet unclassified' }
WAHotwiredClassBrowserNavigationPane class >> on: collectionCalculationBlock [

	^ self new initializeOn: collectionCalculationBlock
]

{ #category : 'accessing' }
WAHotwiredClassBrowserNavigationPane >> cssClass: aString [

	cssClass := aString
]

{ #category : 'accessing' }
WAHotwiredClassBrowserNavigationPane >> filterTerm: aString [

	filterTerm := aString.
	self refreshList.
]

{ #category : 'initialization' }
WAHotwiredClassBrowserNavigationPane >> initializeOn: collectionCalculationBlock [
	
	elementsBlock := collectionCalculationBlock.
	labelsBlock := [ :v | v ]
]

{ #category : 'accessing' }
WAHotwiredClassBrowserNavigationPane >> labels: aBlock [

	labelsBlock := aBlock
]

{ #category : 'accessing' }
WAHotwiredClassBrowserNavigationPane >> list [ 

	list ifNil:[ self refreshList ].
	^ list
]

{ #category : 'accessing' }
WAHotwiredClassBrowserNavigationPane >> onSelectBlock: aBlock [

	onSelectBlock := aBlock
]

{ #category : 'accessing' }
WAHotwiredClassBrowserNavigationPane >> refreshList [

	list := labelsBlock
		        ifNil: [ elementsBlock value sorted ]
		        ifNotNil: [ elementsBlock value sorted: [ :a :b | (labelsBlock value: a) <= (labelsBlock value: b) ] ].
	(filterTerm notNil and: [ filterTerm notEmpty ])
		ifTrue:[ list := list select: [:e | (labelsBlock value: e) includesSubstring: filterTerm caseSensitive: false ] ].
	(list includes: selected) ifFalse: [ selected := nil ]
]

{ #category : 'rendering' }
WAHotwiredClassBrowserNavigationPane >> renderContentOn: html [

			html orderedList
				class: 'code-navigation';
				class: cssClass if: cssClass notNil;
				with: [ 
					self list do:[:item |
						html listItem
							class: 'option-selected' if: self selectedItem = item;
							with: [ 
								html anchor
									"callback: [ self selectedItem: item ];"
									turboStreamCallback: [ :ts | self selectedItem: item. onSelectBlock value: ts ];
									with: (labelsBlock ifNil:[ item ] ifNotNil: [ labelsBlock value: item ]) ] ] ]
				
]

{ #category : 'accessing' }
WAHotwiredClassBrowserNavigationPane >> selectedItem [

	^ selected
]

{ #category : 'accessing' }
WAHotwiredClassBrowserNavigationPane >> selectedItem: anItem [

	selected := anItem
]
