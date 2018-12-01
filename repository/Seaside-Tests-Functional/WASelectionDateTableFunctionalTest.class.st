Class {
	#name : #WASelectionDateTableFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'table'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #hooks }
WASelectionDateTableFunctionalTest >> children [
	^ Array with: table
]

{ #category : #initialization }
WASelectionDateTableFunctionalTest >> initialize [
	super initialize.
	table := WASelectionDateTable new
		startDate: (Date year: 2012 month: 1 day: 1);
		endDate: (Date year: 2012 month: 1 day: 6);
		rowsAndDatesDisplay: [ :row :date |
			(GRPrinter isoDate print: date), ' (', row greaseString, ')' ];
		rows: (1 to: 10)
		yourself
]
