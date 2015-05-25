accessing
sortedWorkingCopies
	| categories packageNames workingCopies |
	categories := Dictionary new.
	packageNames := GRPackage grPackages collect: [ :each | each name ].
	workingCopies := MCWorkingCopy allManagers select: [ :each | packageNames includes: each packageName ].
	workingCopies do: 
		[ :each | 
		| category |
		category := categories 
			at: (each packageName copyUpTo: $-)
			ifAbsentPut: 
				[ SortedCollection sortBlock: [ :a :b | a packageName caseInsensitiveLessOrEqual: b packageName ] ].
		category add: each ].
	categories := Array streamContents: 
		[ :stream | 
		categories keysAndValuesDo: [ :key :value | stream nextPut: key -> value ] ].
	^ categories asSortedCollection: [ :a :b | a key caseInsensitiveLessOrEqual: b key ]