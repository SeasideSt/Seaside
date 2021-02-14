"
I am  tool that renders memory usage.
"
Class {
	#name : #WAMemory,
	#superclass : #WATool,
	#instVars : [
		'instances',
		'table',
		'formatter'
	],
	#classVars : [
		'IgnoredClasses'
	],
	#category : 'Seaside-Pharo-Development-Core'
}

{ #category : #initialization }
WAMemory class >> initialize [
	"We don't want to include our own data in the mix.
	Process is excluded because otherwise our Semaphores pull them in and the Process is
	obviously not held onto by the Semaphore indefinitely.
	CompiledMethods are basically always going to be around in the image anyway so are
	not really session-specific data."
	IgnoredClasses := Array with: WAMemory with: WAMemoryItem with: Process with: CompiledMethod
]

{ #category : #private }
WAMemory >> accumulate: anObject [
	(instances at: anObject class ifAbsentPut: [ WAMemoryItem on: anObject class ])
		accumulate: anObject
]

{ #category : #private }
WAMemory >> buildTable [
	^ WATableReport new
		rows: instances values;
		columns: (Array
			with: (WAReportColumn new
				title: 'Class';
				selector: #name;
				sortBlock: [ :a :b | a < b ];
				yourself)
			with: (WAReportColumn new
				title: 'Instances';
				selector: #count;
				sortBlock: [ :a :b | a > b ];
				cssClass: 'right';
				hasTotal: true;
				yourself)
			with: (WAReportColumn new
				title: 'Total Size';
				selector: #size;
				sortBlock: [ :a :b | a > b ];
				formatBlock: [ :each | formatter print: each ];
				cssClass: 'right';
				hasTotal: true;
				yourself));
		yourself
]

{ #category : #hooks }
WAMemory >> children [
	^ Array with: table
]

{ #category : #initialization }
WAMemory >> initialize [
	super initialize.
	instances := IdentityDictionary new.
	formatter := GRPrinter binaryFileSize.
	self session 
		traverseWithMemory: self
		seen: (IdentitySet with: self with: self session with: self application).
	table := self buildTable
]

{ #category : #rendering }
WAMemory >> renderContentOn: html [
	html div
		class: 'tool';
		with: table
]

{ #category : #accessing }
WAMemory >> totalInstances [
	^ instances inject: 0 into: [ :sum :each | sum + each count ]
]

{ #category : #accessing }
WAMemory >> totalSize [
	^ instances inject: 0 into: [ :sum :each | sum + each size ]
]

{ #category : #private }
WAMemory >> traverse: anObject value: aValue seen: anIdentitySet [
	(aValue isNil or: [ aValue isLiteral or: [ aValue isBehavior or: [ (anIdentitySet includes: aValue) or: [ IgnoredClasses anySatisfy: [ :each | aValue isKindOf: each ] ] ] ] ])
		ifTrue: [ ^ self ].
	aValue traverseWithMemory: self seen: anIdentitySet
]
