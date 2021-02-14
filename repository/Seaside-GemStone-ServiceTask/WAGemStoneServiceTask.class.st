Class {
	#name : #WAGemStoneServiceTask,
	#superclass : #Object,
	#instVars : [
		'taskBlock',
		'taskValue',
		'exception',
		'id',
		'hasValue'
	],
	#classVars : [
		'InProcess',
		'Queue'
	],
	#category : 'Seaside-GemStone-ServiceTask'
}

{ #category : #accessing }
WAGemStoneServiceTask class >> idHighWater [

	^System persistentCounterAt: self idIndex
]

{ #category : #accessing }
WAGemStoneServiceTask class >> idIndex [

	^2
]

{ #category : #accessing }
WAGemStoneServiceTask class >> inProcess [

	InProcess == nil ifTrue: [ InProcess := RcIdentityBag new: 100 ].
	^InProcess
]

{ #category : #accessing }
WAGemStoneServiceTask class >> inProcessCollection [
  "sorted inProcess"

  ^ (self inProcess collect: [ :each | each ]) sortBy: [ :a :b | a id < b id ]
]

{ #category : #accessing }
WAGemStoneServiceTask class >> incrementSharedCounterValue [

	System _sharedCounter: self sharedCounterIndex incrementBy: 1
]

{ #category : #initialization }
WAGemStoneServiceTask class >> initialize [
	"self initialize"

	self 
		reset;
		inProcess;
		queue.
	WAGemStoneServiceVMTask 
		initialize; 
		resetTasks
]

{ #category : #accessing }
WAGemStoneServiceTask class >> newId [

	^System persistentCounterAt: self idIndex incrementBy: 1
]

{ #category : #accessing }
WAGemStoneServiceTask class >> queue [

	Queue == nil ifTrue: [ Queue := RcQueue new: 100 ].
	^Queue
]

{ #category : #accessing }
WAGemStoneServiceTask class >> reset [

	InProcess := Queue := nil.
	System sharedCounter: self sharedCounterIndex setValue: 1.
	System persistentCounterAt: self idIndex put: 0

]

{ #category : #accessing }
WAGemStoneServiceTask class >> setSharedCounterValue: anInteger [

	System sharedCounter: self sharedCounterIndex setValue: anInteger.

]

{ #category : #accessing }
WAGemStoneServiceTask class >> sharedCounterIndex [

	^1
]

{ #category : #accessing }
WAGemStoneServiceTask class >> sharedCounterValue [

	^(System _sharedCounterFetchValuesFrom: self sharedCounterIndex to: self sharedCounterIndex) at: 1
]

{ #category : #'instance creation' }
WAGemStoneServiceTask class >> value: aBlock [
	^ self new
		value: aBlock;
		id: self newId;
		yourself
]

{ #category : #private }
WAGemStoneServiceTask >> addToQueue [
	self class queue add: self.
	self class incrementSharedCounterValue.
]

{ #category : #private }
WAGemStoneServiceTask >> exception [
	^ exception
]

{ #category : #private }
WAGemStoneServiceTask >> hasError [
	^ exception ~~ nil
]

{ #category : #accessing }
WAGemStoneServiceTask >> hasValue [
	^ hasValue ifNil: [false]
]

{ #category : #accessing }
WAGemStoneServiceTask >> id [
   ^ id
]

{ #category : #accessing }
WAGemStoneServiceTask >> id: anId [
	id := anId
]

{ #category : #private }
WAGemStoneServiceTask >> performSafely: aBlock [
  "catch errors, halts and breakpoints ... service vm is non-interactive ... 
	 record the error (in transaction) and let the process servicing this task terminate ... 
	 it's up to someone else to clean up:)"

  aBlock
    on: Error , Halt , Breakpoint
    do: [ :ex | 
      GRPlatform current
        doTransaction: [ 
          exception := ex.
          DebuggerLogEntry createContinuationLabeled: 'SVCE continuation'.
          (ObjectLogEntry
            error: 'Background task exception: ''' , ex description , ''''
            object: aBlock) addToLog ].
      ^ nil ]
]

{ #category : #printing }
WAGemStoneServiceTask >> printOn: aStream [
  aStream nextPutAll: 'task: #' , self id printString , ' ('.
  self hasValue
    ifTrue: [ aStream nextPutAll: 'hasValue: ' , self value printString ]
    ifFalse: [ 
      self hasError
        ifTrue: [ aStream nextPutAll: 'ERROR: ' , self exception description ]
        ifFalse: [ aStream nextPutAll: 'not finished' ] ].
  aStream nextPutAll: ')'
]

{ #category : #actions }
WAGemStoneServiceTask >> processTask [
	| value |
	self performSafely: [ value := taskBlock value ].

	GRPlatform current doTransaction: [ 
		taskValue := value.
		hasValue := true.
		self class inProcess remove: self ]
]

{ #category : #accessing }
WAGemStoneServiceTask >> value [
	^ taskValue
]

{ #category : #accessing }
WAGemStoneServiceTask >> value: theTaskBlock [
	taskBlock := theTaskBlock.
	self addToQueue
]
