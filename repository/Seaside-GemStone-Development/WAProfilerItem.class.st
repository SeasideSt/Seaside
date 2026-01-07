Class {
	#name : 'WAProfilerItem',
	#superclass : 'WAObject',
	#instVars : [
		'request',
		'profmonitor'
	],
	#category : 'Seaside-GemStone-Development-Core',
	#package : 'Seaside-GemStone-Development',
	#tag : 'Core'
}

{ #category : 'as yet unclassified' }
WAProfilerItem class >> request: aRequest [
	^ self basicNew initializeOn: aRequest; yourself
]

{ #category : 'accessing' }
WAProfilerItem >> duration [
	^ Duration seconds: (self end - self start)
]

{ #category : 'accessing' }
WAProfilerItem >> end [
	^ profmonitor endTime
]

{ #category : 'initialization' }
WAProfilerItem >> initializeOn: aRequest [
	self initialize.
	request := aRequest
]

{ #category : 'public' }
WAProfilerItem >> profile: aBlock [
	profmonitor := ProfMonitor new.
	profmonitor startMonitoring.
	[ aBlock value ]
		ensure: [  profmonitor stopMonitoring; gatherResults; removeFile.  ]
]

{ #category : 'accessing' }
WAProfilerItem >> report [ 
	^ profmonitor reportDownTo: 1
]

{ #category : 'accessing' }
WAProfilerItem >> request [
	"Answer the request causing this profile."
	
	^ request
]

{ #category : 'accessing' }
WAProfilerItem >> start [
	^ profmonitor startTime
]
