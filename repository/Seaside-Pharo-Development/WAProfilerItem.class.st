Class {
	#name : #WAProfilerItem,
	#superclass : #WAObject,
	#instVars : [
		'start',
		'tally',
		'request'
	],
	#category : 'Seaside-Pharo-Development-Core-Profiler'
}

{ #category : #'instance creation' }
WAProfilerItem class >> request: aRequest [
	^ self basicNew initializeOn: aRequest; yourself
]

{ #category : #'accessing-dynamic' }
WAProfilerItem >> duration [
	"Answer the receiver's run time."

	^ self tally time milliSeconds
]

{ #category : #initialization }
WAProfilerItem >> initializeOn: aRequest [
	self initialize.
	request := aRequest
]

{ #category : #'accessing-dynamic' }
WAProfilerItem >> leavesBySends [
	^ String streamContents: [ :stream | 
		self tally leavesPrintExactOn: stream ]
]

{ #category : #'accessing-dynamic' }
WAProfilerItem >> leavesByTime [
	^ String streamContents: [ :stream | 
		self tally leavesPrintOn: stream threshold: 1 ]
]

{ #category : #public }
WAProfilerItem >> profile: aBlock [
	start := DateAndTime now.
	tally := MessageTally new.
	tally reportOtherProcesses: false.
	^ tally spyEvery: 1 on: aBlock
]

{ #category : #accessing }
WAProfilerItem >> request [
	"Answer the request causing this profile."
	
	^ request
]

{ #category : #accessing }
WAProfilerItem >> start [
	"Answer the start timestamp when this profile was collected."

	^ start
]

{ #category : #'accessing-dynamic' }
WAProfilerItem >> stats [
	^ String streamContents: [ :stream | 
		self tally reportGCStatsOn: stream ]
]

{ #category : #accessing }
WAProfilerItem >> tally [
	"Answer the tally of this profile."

	^ tally
]

{ #category : #accessing }
WAProfilerItem >> time [
	"Answer the receiver's run time."

	^ self tally time
]

{ #category : #'accessing-dynamic' }
WAProfilerItem >> tree [
	^ String streamContents: [ :stream | 
		self tally
			maxTabs: SmallInteger maxVal;
			maxClassNameSize: SmallInteger maxVal;
			maxClassPlusSelectorSize: SmallInteger maxVal;
			treePrintOn: stream 
			tabs: OrderedCollection new
			thisTab: String new
			total: tally tally
			totalTime: tally time
			tallyExact: false
			orThreshold: 2 ]
]
