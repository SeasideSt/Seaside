Class {
	#name : #WAGemStoneServiceVMTask,
	#superclass : #WAGemStoneMaintenanceTask,
	#classInstVars : [
		'ServiceTasks'
	],
	#category : 'Seaside-GemStone-ServiceTask'
}

{ #category : #initialization }
WAGemStoneServiceVMTask class >> buildTaskList [
	"self buildTaskList"

	(self class allSelectors select: [:ea | ea beginsWith: 'serviceVMTask' ]) do:[:selector | | task |
		task := self perform: selector.
		"add task only if it isn't already in task list"
		self taskNamed: task name ifAbsent: [ self tasks add: task ]].
]

{ #category : #initialization }
WAGemStoneServiceVMTask class >> initialize [
	"self initialize"
	
	ServiceTasks := nil.
	self buildTaskList
]

{ #category : #accessing }
WAGemStoneServiceVMTask class >> outstandingRequests [

	^WAGemStoneServiceTask inProcess size
]

{ #category : #'default serviceVM tasks' }
WAGemStoneServiceVMTask class >> serviceVMTaskServiceExample [
	"WAGemStoneServiceTask initialize"


	^self 
		name: 'Service VM Example'
		frequency: 1 " run once per 200ms"
		valuable: [:vmTask | | persistentCounterValue |
			((self outstandingRequests < 100)
				and: [ (persistentCounterValue := WAGemStoneServiceTask sharedCounterValue) > vmTask state ])
				ifTrue: [ | tasks repeat |
					repeat := true.
					[ repeat and: [ (self outstandingRequests < 100) ]] whileTrue: [ 
						repeat := false.
						tasks := #().
						GRPlatform current doTransaction: [ 
							WAGemStoneServiceTask queue size > 0
								ifTrue: [ 
									vmTask state: persistentCounterValue.
									tasks := WAGemStoneServiceTask queue removeCount: 10 .
									WAGemStoneServiceTask inProcess addAll: tasks ]]. 
						tasks do: [:task | [ task processTask ] fork ].
						repeat := tasks size > 0
							ifTrue: [ (GRPlatform current doTransaction: [ WAGemStoneServiceTask queue size > 0 ])
										and: [self outstandingRequests  < 100]]
							ifFalse: [ false ]]]]
		reset: [:vmTask | vmTask state: 0 ]
]

{ #category : #accessing }
WAGemStoneServiceVMTask class >> tasks [

	ServiceTasks == nil ifTrue: [ ServiceTasks := OrderedCollection new ].
	^ServiceTasks
]

{ #category : #operations }
WAGemStoneServiceVMTask class >> vmStartup [
	"take all inProcess tasks and put them back in the queue"
	

	GRPlatform current doTransaction: [
		(ObjectLogEntry 
			debug: 'SVCE STATS: Startup [1]' 
			object: 
				'queue: ',  WAGemStoneServiceTask queue size asString, 
				"' insts: ', WAGemStoneServiceTask instances size asString,"
				' scv: ', WAGemStoneServiceTask sharedCounterValue asString, 
				' hw: ', WAGemStoneServiceTask idHighWater asString,
				' inprocess: ', WAGemStoneServiceTask inProcess size asString
		) addToLog.
		WAGemStoneServiceTask queue addAll: WAGemStoneServiceTask inProcess.
		WAGemStoneServiceTask inProcess removeAll: WAGemStoneServiceTask inProcess.
		(ObjectLogEntry 
			debug: 'SVCE STATS: Startup [2]' 
			object: 
				'queue: ',  WAGemStoneServiceTask queue size asString, 
				"' insts: ', WAGemStoneServiceTask instances size asString,"
				' scv: ', WAGemStoneServiceTask sharedCounterValue asString, 
				' hw: ', WAGemStoneServiceTask idHighWater asString,
				' inprocess: ', WAGemStoneServiceTask inProcess size asString
		) addToLog.
	].
	"prime the pump"
	WAGemStoneServiceTask setSharedCounterValue: (self tasks first state) + 1.
]
