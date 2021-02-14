Class {
	#name : #WASeasideVersionStatus,
	#superclass : #WAPharoStatusItem,
	#category : 'Seaside-Squeak-Tools-Web'
}

{ #category : #accessing }
WASeasideVersionStatus >> label [
	^ 'Seaside'
]

{ #category : #accessing }
WASeasideVersionStatus >> priority [
	^ 200
]

{ #category : #rendering }
WASeasideVersionStatus >> renderPackagesOn: html [
	| workingCopies |
	workingCopies :=  [ self sortedWorkingCopies ]
		on: Error
		do: [ :e |
			html render: 'Could not resolve working copies'.
			^ self ].
	html table: [
		html tableHead: [
			html tableRow: [
				html tableHeading: 'Package'.
				html tableHeading: 'Version' ] ].
		workingCopies do: [ :category |
			html tableRow: [
				html tableHeading: category key.
				html tableHeading ].
			category value do: [ :each |
				html tableRow: [
					html tableData: each packageName.
					html tableData: (each ancestry ancestorString copyAfterLast: $-) ] ] ] ]
]

{ #category : #rendering }
WASeasideVersionStatus >> renderValuesOn: html [
	self renderLabel: 'Seaside Version' value: GRPlatform current seasideVersion greaseString on: html.
	self renderLabel: 'Grease Version' value: GRPlatform current versionString on: html.
	self renderLabel: 'Packages' value: [ self renderPackagesOn: html ] on: html
]

{ #category : #accessing }
WASeasideVersionStatus >> sortedWorkingCopies [
	| categories packageNames workingCopies |
	categories := Dictionary new.
	packageNames := GRPackage grPackages collect: [ :each | each name ].
	workingCopies := MCWorkingCopy allManagers select: [ :each | packageNames includes: each packageName ].
	workingCopies do: [ :each | 
		| category |
		category := categories 
			at: (each packageName copyUpTo: $-)
			ifAbsentPut: [
				SortedCollection sortBlock: [ :a :b |
					a packageName caseInsensitiveLessOrEqual: b packageName ] ].
		category add: each ].
	categories := Array streamContents: [ :stream | 
		categories keysAndValuesDo: [ :key :value | stream nextPut: key -> value ] ].
	^ categories asSortedCollection: [ :a :b | a key caseInsensitiveLessOrEqual: b key ]
]

{ #category : #accessing }
WASeasideVersionStatus >> title [
	^ 'Seaside Packages'
]
