"
I display render and callback times.
"
Class {
	#name : #WATimingToolPlugin,
	#superclass : #WAToolPlugin,
	#instVars : [
		'filter'
	],
	#category : 'Seaside-Development-Plugins'
}

{ #category : #initialization }
WATimingToolPlugin >> initializeRequestor: aRequestorObject [
	super initializeRequestor: aRequestorObject.
	filter := self session filters
		detect: [ :each | each isKindOf: WATimingToolFilter ]
		ifNone: [ self session addFilter: WATimingToolFilter new ]
]

{ #category : #accessing }
WATimingToolPlugin >> priority [
	^ 900
]

{ #category : #rendering }
WATimingToolPlugin >> renderContentOn: html [
	html span class: self cssClass; with: [
		html span
			title: 'Callback Time';
			with: filter previousTiming.
		html text: '/'.
		html span
			title: 'Render Time';
			with: filter currentTiming.
		html text: ' ms' ]
]
