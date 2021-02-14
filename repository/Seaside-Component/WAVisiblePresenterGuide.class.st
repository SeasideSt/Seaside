"
Visit the tree of all Presenters and their registered #children. Do not visit a Decoration's #next Decoration if the Decoration indicates that it is not visible.
"
Class {
	#name : #WAVisiblePresenterGuide,
	#superclass : #WAPresenterGuide,
	#category : 'Seaside-Component-Visitors'
}

{ #category : #private }
WAVisiblePresenterGuide >> shouldVisitNextPresenterOf: aDecoration [
	^ aDecoration isDelegation not
]

{ #category : #visiting }
WAVisiblePresenterGuide >> visitDecoration: aDecoration [
	super visitDecoration: aDecoration.
	(self shouldVisitNextPresenterOf: aDecoration)
		ifTrue: [ aDecoration next accept: self ]
]

{ #category : #visiting }
WAVisiblePresenterGuide >> visitPresenter: aPresenter [
	super visitPresenter: aPresenter.
	aPresenter childrenDo: [ :each | self visit: each ]
]
