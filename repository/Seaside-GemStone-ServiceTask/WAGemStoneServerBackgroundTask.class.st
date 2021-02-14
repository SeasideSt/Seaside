Class {
	#name : #WAGemStoneServerBackgroundTask,
	#superclass : #Object,
	#instVars : [
		'futureValue',
		'task'
	],
	#category : 'Seaside-GemStone-ServiceTask'
}

{ #category : #'instance creation' }
WAGemStoneServerBackgroundTask class >> task: taskBlock session: aSession [
  ^ self new
    task: taskBlock session: aSession;
    yourself
]

{ #category : #'instance creation' }
WAGemStoneServerBackgroundTask class >> value: taskBlock [
	^ self new
		value: taskBlock;
		yourself
]

{ #category : #testing }
WAGemStoneServerBackgroundTask >> exception [
    ^ task exception.
]

{ #category : #testing }
WAGemStoneServerBackgroundTask >> hasError [
    ^ task hasError.
]

{ #category : #testing }
WAGemStoneServerBackgroundTask >> hasValue [
    ^ task hasValue.
]

{ #category : #'instance-creation' }
WAGemStoneServerBackgroundTask >> task: taskBlock session: aSession [
  task := WAGemStoneServiceTask
    value: [ (Smalltalk at: #'WADynamicVariable') use: aSession during: taskBlock ]
]

{ #category : #accessing }
WAGemStoneServerBackgroundTask >> value [
	^ task value
]

{ #category : #accessing }
WAGemStoneServerBackgroundTask >> value: taskBlock [ 
	task := WAGemStoneServiceTask value: taskBlock
]
