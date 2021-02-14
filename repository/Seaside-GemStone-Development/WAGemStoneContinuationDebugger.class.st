Class {
	#name : #WAGemStoneContinuationDebugger,
	#superclass : #WAGemStoneWalkback,
	#instVars : [
		'errorDescription'
	],
	#category : 'Seaside-GemStone-Development'
}

{ #category : #accessing }
WAGemStoneContinuationDebugger >> exceptionDescription [
	^ ''
]

{ #category : #initialization }
WAGemStoneContinuationDebugger >> initializeWithContinuation: aContinuation [
	self initializeWithContext: (self currentContextForContinuation: aContinuation).
]

{ #category : #rendering }
WAGemStoneContinuationDebugger >> renderAnsweringToolsOn: html [
	self limit < self frameCount ifTrue: [
		html space.
		html anchor
			callback: [ self showFullStack ];
			with: 'Full Stack' ]
]

{ #category : #rendering }
WAGemStoneContinuationDebugger >> renderContentOn: html [
	self renderHeadingOn: html.
	self renderToolsOn: html.
	self renderStackOn: html
]

{ #category : #rendering }
WAGemStoneContinuationDebugger >> renderHeadingOn: html [
	html heading level: 1; with: 'Seaside Walkback'.
]
