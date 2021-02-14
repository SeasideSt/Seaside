Class {
	#name : #SUTreeReportColumn,
	#superclass : #WAObject,
	#instVars : [
		'owner',
		'renderer',
		'label'
	],
	#category : 'Scriptaculous-Components-Core'
}

{ #category : #'instance creation' }
SUTreeReportColumn class >> on: aComponent [
	^ self basicNew initializeOn: aComponent
]

{ #category : #initialization }
SUTreeReportColumn >> initializeOn: aComponent [
	self initialize.
	owner := aComponent
]

{ #category : #accessing }
SUTreeReportColumn >> label [
	^ label
]

{ #category : #accessing }
SUTreeReportColumn >> label: aString [
	label := aString
]

{ #category : #rendering }
SUTreeReportColumn >> render: anObject indent: anInteger on: html [
	html div class: 'indent'; with: [
		anInteger timesRepeat: [ html div class: 'block' ].
		html div class: 'block'; with: [
			(owner isExpandable: anObject) ifTrue: [
				html anchor
					class: 'expanded' if: (owner isExpanded: anObject);
					onClick: (html prototype evaluator 
						callback: [ :script | owner toggle: anObject level: anInteger on: script ];
						return: false) ] ].
		html div class: 'text'; with: [ self render: anObject on: html ] ]
]

{ #category : #rendering }
SUTreeReportColumn >> render: anObject on: html [
	html render: (renderer value: anObject)
]

{ #category : #accessing }
SUTreeReportColumn >> renderer [
	^ renderer
]

{ #category : #accessing }
SUTreeReportColumn >> renderer: aBlock [
	renderer := aBlock
]
