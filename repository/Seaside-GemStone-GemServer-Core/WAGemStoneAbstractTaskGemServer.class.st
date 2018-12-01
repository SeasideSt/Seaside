Class {
	#name : #WAGemStoneAbstractTaskGemServer,
	#superclass : #GemServer,
	#category : 'Seaside-GemStone-GemServer-Core'
}

{ #category : #'instance creation' }
WAGemStoneAbstractTaskGemServer class >> createServerOfClass: aTaskClass withName: aName on: anArrayOfPortNumbersOrResourceNames [
  "taskClass replaces serverClass for task gem servers"

  ^ self new
    taskClass: aTaskClass;
    name: aName;
    portOrResourceNameList: anArrayOfPortNumbersOrResourceNames;
    yourself
]

{ #category : #accessing }
WAGemStoneAbstractTaskGemServer class >> defaultPortOrResourceNameList [
  "no ports for maintenance vm ... single instance of maintenance should be launched"

  ^ #('instance')
]

{ #category : #accessing }
WAGemStoneAbstractTaskGemServer class >> delayTimeMs [
  ^ 60000
]

{ #category : #'instance creation' }
WAGemStoneAbstractTaskGemServer class >> register: aName for: aTaskClass [
  ^ (self
    createServerOfClass: aTaskClass
    withName: aName
    on: self defaultPortOrResourceNameList)
    register;
    yourself
]

{ #category : #accessing }
WAGemStoneAbstractTaskGemServer class >> serverClass [
  "no serverClass used ... but the taskClass replaces serverClass for task gem servers"

  ^ self taskClass
]

{ #category : #accessing }
WAGemStoneAbstractTaskGemServer class >> taskClass [
  self subclassResponsibility
]

{ #category : #'service instance-server' }
WAGemStoneAbstractTaskGemServer >> basicServerOn: port [
  "forked by caller"

  | count |
  count := 0.
  [ true ]
    whileTrue: [ 
      self
        gemServer: [ 
          "run maintenance tasks"
          self taskClass performTasks: count ].
      (Delay forMilliseconds: self delayTimeMs) wait.	"Sleep for a minute"
      count := count + 1 ]
]

{ #category : #accessing }
WAGemStoneAbstractTaskGemServer >> delayTimeMs [
  ^ self class delayTimeMs
]

{ #category : #'server compat' }
WAGemStoneAbstractTaskGemServer >> stop [
  self basicServerProcess
    ifNotNil: [ :proc | 
      self basicServerProcess: nil.
      proc terminate ]
]

{ #category : #accessing }
WAGemStoneAbstractTaskGemServer >> taskClass [
  "taskClass is a more meaningful name for task gem servers"

  ^ self serverClass
]

{ #category : #accessing }
WAGemStoneAbstractTaskGemServer >> taskClass: aTaskClass [
  "taskClass is a more meaningful name for task gem servers"

  self serverClass: aTaskClass
]
