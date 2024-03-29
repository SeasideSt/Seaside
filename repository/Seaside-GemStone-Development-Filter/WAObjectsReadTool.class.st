Class {
	#name : 'WAObjectsReadTool',
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
WAObjectsReadTool class >> on: aCollection [
	^ self basicNew initializeOn: aCollection; yourself
]

{ #category : 'accessing' }
WAObjectsReadTool >> buildReport [
	^ WATableReport new
		rows: self items;
		columns: (OrderedCollection new
				add: (WAReportColumn new
						title: 'Start';
						selector: #start;
						cssClass: 'left';
						yourself);
				add: (WAReportColumn new
						title: 'End';
						selector: #end;
						cssClass: 'left';
						yourself);
				add: (WAReportColumn new
						title: 'Size';
						selector: #size;
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
WAObjectsReadTool >> initializeOn: aCollection [
	self initialize.
	items := aCollection
]

{ #category : 'accessing' }
WAObjectsReadTool >> items [
	^ items
]

{ #category : 'accessing' }
WAObjectsReadTool >> message [
	^message
]

{ #category : 'accessing' }
WAObjectsReadTool >> renderCommands: anItem on: html [
	html anchor
		callback: [ message := anItem report ];
		with: 'Report'.
]

{ #category : 'accessing' }
WAObjectsReadTool >> renderContentOn: html [
	html div class: 'tool'; with: self report.
	self message isNil 
		ifFalse: [ html preformatted: self message ]
]

{ #category : 'accessing' }
WAObjectsReadTool >> report [
	^ report ifNil: [ report := self buildReport ]
]
