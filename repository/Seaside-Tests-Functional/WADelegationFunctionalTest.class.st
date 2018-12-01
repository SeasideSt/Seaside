"
http://code.google.com/p/seaside/issues/detail?id=71
"
Class {
	#name : #WADelegationFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'task'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #hooks }
WADelegationFunctionalTest >> children [
	^ Array with: task
]

{ #category : #initialization }
WADelegationFunctionalTest >> initialize [
	super initialize.
	task := WADelegationTask new
]

{ #category : #rendering }
WADelegationFunctionalTest >> renderContentOn: html [
	html orderedList: [
		html listItem: 'Click button of Step 1'.
		html listItem: 'Click back-button'.
		html listItem: 'Click button of Step 1'.
		html listItem: 'Click button of Step 2' ].
	html paragraph: 'Step 1 and Step 2 should have consistent number of visible presenters. Especially there should never be two WAAnswerDecorations.'.
	
	html heading level: 2; with: 'Application'.
	html render: task.
	
	html heading level: 2; with: 'Visible Presenters'.
	html table: [
		html tableRow: [
			html tableHeading: 'Presenter'.
			html tableHeading.
			html tableHeading: 'Next'.
			html tableHeading ].
		self visiblePresentersDo: [ :each |
			html tableRow: [
				html tableData: each printString.
				html tableData: each identityHash.
				html tableData: (each isDecoration
					ifTrue: [ each next printString ]
					ifFalse: [ each decoration printString ]).
				html tableData: (each isDecoration
					ifTrue: [ each next identityHash ]
					ifFalse: [ each decoration identityHash ]) ] ] ]
]
