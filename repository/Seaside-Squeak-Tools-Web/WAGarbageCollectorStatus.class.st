"
A WAGarbageCollectorStatus displays information about the garbage collector.

"
Class {
	#name : #WAGarbageCollectorStatus,
	#superclass : #WAPharoStatusItem,
	#category : 'Seaside-Squeak-Tools-Web'
}

{ #category : #accessing }
WAGarbageCollectorStatus >> label [
	^ 'GC'
]

{ #category : #accessing }
WAGarbageCollectorStatus >> priority [
	^ 600
]

{ #category : #rendering }
WAGarbageCollectorStatus >> renderCogValuesOn: html [
	self renderLabel: 'Cog VM - Size of eden (bytes)' value: (SmalltalkImage current vmParameterAt: 44) on: html

]

{ #category : #rendering }
WAGarbageCollectorStatus >> renderContentOn: html [
	super renderContentOn: html.
	
	html heading level2; with: 'Actions'.
	
	html unorderedList: [
		html listItem: [
			html anchor
				callback: [ Smalltalk garbageCollectMost ];
				title: 'Reclaims recently created garbage (which is usually most of it) fairly quickly.';
				with: 'Young Space GC' ].
		html listItem: [
			html anchor
				callback: [ Smalltalk garbageCollect ];
				title: 'Reclaims all garbage.';
				with: 'Full GC' ].
		html listItem: [
			html anchor
				callback: [ Smalltalk forceTenure ];
				title: 'Tell the GC logic to force a tenure on the next increment GC.';
				with: 'Force Tenure' ].
		html listItem: [
			html anchor
				callback: [ Smalltalk setGCBiasToGrow: 1 ];
				title: 'Indicate that the GC logic should be bias to grow.';
				with: 'Set GC Bias to Grow' ].
		html listItem: [
			html anchor
				callback: [ self setBiasToGrowLimit ];
				title: 'Indicate that the bias to grow logic should do a GC after aNumber Bytes.';
				with: 'Set GC Bias to Grow GC Limit' ] ]
]

{ #category : #rendering }
WAGarbageCollectorStatus >> renderHeaderOn: html [
	html tableHead: [
		html tableRow: [
			html tableData.
			html tableHeading: 'Count'.
			html tableHeading: 'Total Time'.
			html tableHeading: 'Avg. Time' ] ]
]

{ #category : #rendering }
WAGarbageCollectorStatus >> renderValuesOn: html [ 
	| incrementalGCs tenures parameters fullGCs fullGCTime incrementalGCTime |
	parameters := SmalltalkImage current getVMParameters.
	fullGCs := parameters at: 7.
	fullGCTime := parameters at: 8.
	incrementalGCs := parameters at: 9.
	incrementalGCTime := parameters at: 10.
	tenures := parameters at: 11.
	self 
		renderLabel: 'Full GCs'
		value: fullGCs
		value: (self printMilliSeconds: fullGCTime)
		value: (self printMilliSeconds: fullGCTime dividedBy: fullGCs)
		on: html.
	self 
		renderLabel: 'Incremental GCs'
		value: incrementalGCs
		value: (self printMilliSeconds: incrementalGCTime)
		value: (self printMilliSeconds: incrementalGCTime dividedBy: incrementalGCs)
		on: html.
	self 
		renderLabel: 'Tenures'
		value: tenures
		on: html.
	tenures isZero ifFalse: [
		self 
			renderLabel: 'Avg. GCs/tenure'
			value: (incrementalGCs / tenures) greaseInteger
			on: html ]
]

{ #category : #actions }
WAGarbageCollectorStatus >> setBiasToGrowLimit [
	self 
		request: 'GC Bias To Grow GC Limit (bytes)'
		onAnswer: [ :limit | Smalltalk setGCBiasToGrowGCLimit: limit greaseInteger ]
]

{ #category : #accessing }
WAGarbageCollectorStatus >> tableBodyCssClass [
	^ 'right'
]

{ #category : #accessing }
WAGarbageCollectorStatus >> title [
	^ 'Garbage Collector'
]
