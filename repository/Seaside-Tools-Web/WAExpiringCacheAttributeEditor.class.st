Class {
	#name : #WAExpiringCacheAttributeEditor,
	#superclass : #WAAttributeEditor,
	#instVars : [
		'handler',
		'maximumSize',
		'maximumAbsoluteAge',
		'maximumRelativeAge',
		'overflowAction',
		'overflowActionLabels'
	],
	#category : 'Seaside-Tools-Web'
}

{ #category : #private }
WAExpiringCacheAttributeEditor >> createCache [
	self subclassResponsibility
]

{ #category : #accessing }
WAExpiringCacheAttributeEditor >> handler [
	^ handler
]

{ #category : #accessing }
WAExpiringCacheAttributeEditor >> handler: anApplication [
	handler := anApplication.
	maximumSize := anApplication configuration at: #maximumSize.
	maximumRelativeAge := anApplication configuration at: #maximumRelativeAge.
	maximumAbsoluteAge := anApplication configuration at: #maximumAbsoluteAge.
	overflowAction := anApplication configuration at: #overflowAction
]

{ #category : #initialization }
WAExpiringCacheAttributeEditor >> initialize [
	super initialize.
	overflowActionLabels := Dictionary new: 3.
	overflowActionLabels at: WAHashCache removeAbsoluteOldest put: 'remove the oldest element'.
	overflowActionLabels at: WAHashCache removeRelativeOldest put: 'remove the element last accessed the longest time ago'.
	overflowActionLabels at: WAHashCache signalError put: 'signal an error'
]

{ #category : #accessing }
WAExpiringCacheAttributeEditor >> maximumAbsoluteAge [
	^ maximumAbsoluteAge
]

{ #category : #accessing }
WAExpiringCacheAttributeEditor >> maximumAbsoluteAge: aStringOrAnInteger [
	maximumAbsoluteAge := aStringOrAnInteger asUnsignedInteger

]

{ #category : #accessing }
WAExpiringCacheAttributeEditor >> maximumRelativeAge [
	^ maximumRelativeAge
]

{ #category : #accessing }
WAExpiringCacheAttributeEditor >> maximumRelativeAge: aStringOrAnInteger [
	maximumRelativeAge := aStringOrAnInteger asUnsignedInteger

]

{ #category : #accessing }
WAExpiringCacheAttributeEditor >> maximumSize [
	^ maximumSize
]

{ #category : #accessing }
WAExpiringCacheAttributeEditor >> maximumSize: aStringOrAnInteger [
	maximumSize := aStringOrAnInteger asUnsignedInteger

]

{ #category : #accessing }
WAExpiringCacheAttributeEditor >> overflowAction [
	^ overflowAction
]

{ #category : #accessing }
WAExpiringCacheAttributeEditor >> overflowAction: aSymbol [
	overflowAction := aSymbol

]

{ #category : #rendering }
WAExpiringCacheAttributeEditor >> renderCacheReplaceOn: html [
	html paragraph: [
		html button
			class: 'large';
			title: 'Replace the cache';
			callback: [ self replaceCache ];
			with: 'Replace cache' ]
]

{ #category : #rendering }
WAExpiringCacheAttributeEditor >> renderMaximumAbsoluteAgeOn: html [
	html tableRow: [
		html tableHeading: [
			html label: 'Maximum Absolute Age' ].
		html tableData: [ 
			html textInput
			size: 5;
			on: #maximumAbsoluteAge of: self ]  ].
	html tableRow: [
		html tableData
			colSpan: 2;
			with: 'After so many seconds after its creation a session is considered expired no matter when it was last accessed. 0 for no limit. Has to be positive.' ]
]

{ #category : #rendering }
WAExpiringCacheAttributeEditor >> renderMaximumRelativeAgeOn: html [
	html tableRow: [
		html tableHeading: [
			html label: 'Maximum Relative Age' ].
		html tableData: [ 
			html textInput
			size: 5;
			on: #maximumRelativeAge of: self ] ].
	
	html tableRow: [
		html tableData
			colSpan: 2;
			with: 'After so many seconds of inactivity a session is considered expired. 0 for no limit. Has to be positive.' ]
]

{ #category : #rendering }
WAExpiringCacheAttributeEditor >> renderMaximumSizeOn: html [
	html tableRow: [
		html tableHeading: [
			html label: 'Maximum Size' ].
		html tableData: [ 
			html textInput
			size: 5;
			on: #maximumSize of: self ] ].
	html tableRow: [
		html tableData
			colSpan: 2;
			with: 'Number of sessions supported. When this limit is reached the overflow action is run. 0 for no maximum size. Has to be positive.' ]
]

{ #category : #rendering }
WAExpiringCacheAttributeEditor >> renderOverflowActionOn: html [
	html tableRow: [
		html tableHeading: [
			html label: 'Overflow Action' ].
		html tableData: [
			html select
				list: WAHashCache overflowActions;
				labels: [ :each |
					overflowActionLabels at: each ifAbsent: [ each ] ];
				on: #overflowAction of: self ] ].
	html tableRow: [
		html tableData
			colSpan: 2;
			with: 'What to do when the maximum number of sessions is reached. Only matters when the maximum size is bigger than 0.' ]
]

{ #category : #actions }
WAExpiringCacheAttributeEditor >> replaceCache [
	self
		confirm: 'This will clear all existing sessions in the current cache. Are you sure you want to continue?'
		onAnswer: [ :answer |
			answer ifTrue: [
				self storeConfigurationValues.
				self handler cache: self createCache ] ]
]

{ #category : #private }
WAExpiringCacheAttributeEditor >> storeConfigurationValues [
	
	handler configuration at: #maximumSize put: maximumSize.
	handler configuration at: #maximumRelativeAge put: maximumRelativeAge.
	handler configuration at: #maximumAbsoluteAge put: maximumAbsoluteAge.
	handler configuration at: #overflowAction put: overflowAction
]
