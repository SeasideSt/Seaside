Class {
	#name : #WABatchFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'batcher'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #hooks }
WABatchFunctionalTest >> children [
	^ Array with: batcher
]

{ #category : #initialization }
WABatchFunctionalTest >> initialize [
	super initialize.
	batcher := WAAlphabeticBatchedList new items: Collection allSubclasses
]

{ #category : #rendering }
WABatchFunctionalTest >> renderContentOn: html [
	html render: batcher.
	html unorderedList
		list: batcher batch
]
