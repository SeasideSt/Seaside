Class {
	#name : #SUTreeReportTest,
	#superclass : #SUFunctionalTest,
	#instVars : [
		'treeReport'
	],
	#category : 'Scriptaculous-Tests-Components'
}

{ #category : #hooks }
SUTreeReportTest >> children [
	^ Array with: treeReport
]

{ #category : #accessing }
SUTreeReportTest >> coreClass [
	^ SUTreeReport
]

{ #category : #initialization }
SUTreeReportTest >> initialize [
	super initialize.
	treeReport := SUTreeReport new
		expand: Collection;
		roots: (Array with: Collection);
		children: [ :value | 
			value subclasses
				asSortedCollection: [ :a :b | a name < b name ] ];
		addColumn: [ :value | value name ]
			label: 'Class Name';
		addColumn: [ :value |
			[ :html |
				value instVarNames
					do: [ :each | html text: each ]
					separatedBy: [ html text: ', ' ] ] ]
			label: 'Instance Variables';
		yourself
]
