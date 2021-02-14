"
I provide a space usage per class.
"
Class {
	#name : #WASpaceStatus,
	#superclass : #WAPharoStatusItem,
	#category : 'Seaside-Pharo-Tools-Web'
}

{ #category : #private }
WASpaceStatus >> classesWithManyInstances [
	^ Array streamContents: [ :stream |
		Smalltalk globals keysAndValuesDo: [ :key :value |
			((value isKindOf: Class) and: [ key == value name ]) ifTrue: [
				| class |
				class := Smalltalk globals at: key.
				(self shouldConsider: class) ifTrue: [
					stream nextPut: class ] ] ] ]
]

{ #category : #accessing }
WASpaceStatus >> label [
	^ 'Space (slow!)'
]

{ #category : #accessing }
WASpaceStatus >> priority [
	^ 1000
]

{ #category : #rendering }
WASpaceStatus >> renderValue: anObject on: html [
	html tableData
		align: 'right';
		with: anObject
]

{ #category : #rendering }
WASpaceStatus >> renderValuesOn: html [
	| items totalSpaceForInstances |
	items := self spaceTallyItems.
	totalSpaceForInstances := 0.
	items do: [ :each |
		totalSpaceForInstances := totalSpaceForInstances + each spaceForInstances  ].
	html table: [
		html tableHead: [
			html tableRow: [
				html tableHeading: 'Class'.
				html tableHeading: 'code space'.
				html tableHeading: '# instances'.
				html tableHeading: 'inst space'.
				html tableHeading: 'percent' ] ].
		html tableBody: [
			items do: [ :each |
				html tableRow: [
					html tableHeading align: 'right'; with: each analyzedClassName.
					self renderValue: each codeSize on: html.
					self renderValue: each instanceCount on: html.
					self renderValue: each spaceForInstances on: html.
					self renderValue: (self percent: each spaceForInstances / totalSpaceForInstances) on: html  ] ] ] ]
	

]

{ #category : #private }
WASpaceStatus >> shouldConsider: aClass [
	| count |
	count := 0.
	aClass allInstancesDo: [ :instance |
		count := count + 1.
		count >= 100 ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #private }
WASpaceStatus >> spaceTallyItems [
	^ (SpaceTally new spaceTally: self classesWithManyInstances)
		sort: [ :a :b | a spaceForInstances > b spaceForInstances ]
]

{ #category : #accessing }
WASpaceStatus >> title [
	^ 'Space Usage per Class'
]
