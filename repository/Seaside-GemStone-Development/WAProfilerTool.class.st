Class {
	#name : 'WAProfilerTool',
	#superclass : 'WATool',
	#instVars : [
		'report',
		'items',
		'message'
	],
	#category : 'Seaside-GemStone-Development-Core',
	#package : 'Seaside-GemStone-Development',
	#tag : 'Core'
}

{ #category : 'as yet unclassified' }
WAProfilerTool class >> on: aCollection [
	^ self basicNew initializeOn: aCollection; yourself
]

{ #category : 'private' }
WAProfilerTool >> buildReport [
	^ WATableReport new
		rows: self items;
		columns: (OrderedCollection new
				add: (WAReportColumn new
						title: 'Start';
						selector: #start;
						cssClass: 'left';
						yourself);
				add: (WAReportColumn new
						title: 'Duration';
						selector: #duration;
						cssClass: 'left';
						yourself);
				add: (WAReportColumn new
						title: 'Request';
						valueBlock: [ :value | value request method , ' ' , value request url greaseString ];
						clickBlock: [ :value | self show: (WAInspector current on: value request) ];
						yourself);
				add: (WAReportColumn new
						sortBlock: nil;
						title: 'Commands';
						valueBlock: [ :value :html | 
							self 
								renderCommands: value
								on: html ];
						yourself);
				yourself);
		yourself
]

{ #category : 'initialization' }
WAProfilerTool >> initializeOn: aCollection [
	self initialize.
	items := aCollection
]

{ #category : 'accessing' }
WAProfilerTool >> items [
	^ items
]

{ #category : 'accessing' }
WAProfilerTool >> message [
	^message
]

{ #category : 'rendering' }
WAProfilerTool >> renderCommands: anItem on: html [
	html anchor
		callback: [ message := anItem report ];
		with: 'Report'.
]

{ #category : 'rendering' }
WAProfilerTool >> renderContentOn: html [
	html div class: 'tool'; with: self report.
	self message isNil 
		ifFalse: [ html preformatted: self message ]
]

{ #category : 'accessing' }
WAProfilerTool >> report [
	^ report ifNil: [ report := self buildReport ]
]
