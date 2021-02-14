Class {
	#name : #WAProfilerTool,
	#superclass : #WATool,
	#instVars : [
		'report',
		'items',
		'message'
	],
	#category : 'Seaside-Pharo-Development-Core-Profiler'
}

{ #category : #'instance creation' }
WAProfilerTool class >> on: aCollection [
	^ self basicNew initializeOn: aCollection; yourself
]

{ #category : #private }
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

{ #category : #hooks }
WAProfilerTool >> children [
	^ Array with: self report
]

{ #category : #initialization }
WAProfilerTool >> initializeOn: aCollection [
	self initialize.
	items := aCollection
]

{ #category : #accessing }
WAProfilerTool >> items [
	^ items
]

{ #category : #accessing }
WAProfilerTool >> message [
	^ message
]

{ #category : #rendering }
WAProfilerTool >> renderCommands: anItem on: html [
	html anchor
		callback: [ message := anItem tree ];
		with: 'Tree'.
	html text: ' '.
	html anchor
		callback: [ message := anItem leavesByTime ];
		with: 'Leaves (time)'.
		html text: ' '.
	html anchor
		callback: [ message := anItem leavesBySends ];
		with: 'Leaves (sends)'.
	html text: ' '.
	anItem time > 0
		ifTrue: [
			html anchor
				callback: [ message := anItem stats ];
				with: 'GC Stats' ]
		ifFalse: [
			"avoid ZeroDivide
			https://github.com/SeasideSt/Seaside/issues/968"
			html text: 'GC Stats' ]
 	

]

{ #category : #rendering }
WAProfilerTool >> renderContentOn: html [
	html div class: 'tool'; with: self report.
	self message isNil 
		ifFalse: [ html preformatted: self message ]
]

{ #category : #accessing }
WAProfilerTool >> report [
	^ report ifNil: [ report := self buildReport ]
]
