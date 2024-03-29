"
I am  tool that renders memory usage.
"
Class {
	#name : 'WAMemory',
	#superclass : 'WATool',
	#instVars : [
		'instances',
		'table',
		'formatter'
	],
	#category : 'Seaside-Pharo-Development-Core',
	#package : 'Seaside-Pharo-Development',
	#tag : 'Core'
}

{ #category : 'private' }
WAMemory >> accumulate: anObject [
	(instances at: anObject class ifAbsentPut: [ WAMemoryItem on: anObject class ])
		accumulate: anObject
]

{ #category : 'private' }
WAMemory >> buildTable [
	| classColumn instanceCountColumn totalSizeColumn |
	classColumn := WAReportColumn new
				title: 'Class';
				selector: #name;
				sortBlock: [ :a :b | a < b ];
				yourself.
	instanceCountColumn := WAReportColumn new
				title: 'Instances';
				selector: #count;
				sortBlock: [ :a :b | a > b ];
				cssClass: 'right';
				hasTotal: true;
				yourself.
	totalSizeColumn := WAReportColumn new
				title: 'Total Size';
				selector: #size;
				sortBlock: [ :a :b | a > b ];
				formatBlock: [ :each | formatter print: each ];
				cssClass: 'right';
				hasTotal: true;
				yourself.
	^ WATableReport new
		rows: instances values;
		columns: (Array
			with: classColumn
			with: instanceCountColumn
			with: totalSizeColumn);
		sortColumn: totalSizeColumn;
		yourself
]

{ #category : 'hooks' }
WAMemory >> children [
	^ Array with: table
]

{ #category : 'initialization' }
WAMemory >> initialize [
	super initialize.
	instances := IdentityDictionary new.
	formatter := GRPrinter binaryFileSize.
	self session 
		traverseWithMemory: self
		seen: (IdentitySet with: self with: self session with: self application).
	table := self buildTable
]

{ #category : 'rendering' }
WAMemory >> renderContentOn: html [
	html div
		class: 'tool';
		with: table
]

{ #category : 'accessing' }
WAMemory >> totalInstances [
	^ instances inject: 0 into: [ :sum :each | sum + each count ]
]

{ #category : 'accessing' }
WAMemory >> totalSize [
	^ instances inject: 0 into: [ :sum :each | sum + each size ]
]

{ #category : 'private' }
WAMemory >> traverse: anObject value: aValue seen: anIdentitySet [
	(aValue isNil or: [ anIdentitySet includes: aValue ])
		ifTrue: [ ^ self ].
	aValue traverseWithMemory: self seen: anIdentitySet
]

{ #category : 'hooks' }
WAMemory >> traverseWithMemory: aMemory seen: anIdentitySet [
	"don't report self"
	anIdentitySet add: self
]
