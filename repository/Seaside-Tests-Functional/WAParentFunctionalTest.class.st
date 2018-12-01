Class {
	#name : #WAParentFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'parent'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #accessing }
WAParentFunctionalTest >> parent: aComponent [
	parent := aComponent
]

{ #category : #rendering }
WAParentFunctionalTest >> renderContentOn: html [
	self renderExplanationOn: html.
	self renderSwapParentOn: html
]

{ #category : #rendering }
WAParentFunctionalTest >> renderExplanationOn: html [
	html paragraph: 'This regression tests checks if #call:onAnswer: on the parent component works. If you click "swap parent" "Test passes!" should appear without a tab panel.'
]

{ #category : #rendering }
WAParentFunctionalTest >> renderSwapParentOn: html [
	html paragraph: [
		html anchor
			callback: [ self swap ];
			with: 'swap parent' ]
]

{ #category : #actions }
WAParentFunctionalTest >> swap [
	parent inform: 'Test passes!' onAnswer: [ ]
]
