Class {
	#name : #WAGemStoneMaintenanceTask,
	#superclass : #Object,
	#instVars : [
		'name',
		'frequency',
		'valuable',
		'state',
		'resetBlock'
	],
	#classVars : [
		'Tasks'
	],
	#category : 'Seaside-GemStone-Tools-Production-Gems'
}

{ #category : #initialization }
WAGemStoneMaintenanceTask class >> buildTaskList [
	"self buildTaskList"

	(self class allSelectors select: [:ea | ea beginsWith: 'maintenanceTask' ]) do:[:selector | | task |
		task := self perform: selector.
		"add task only if it isn't already in task list"
		self taskNamed: task name ifAbsent: [ self tasks add: task ]].
]

{ #category : #initialization }
WAGemStoneMaintenanceTask class >> initialize [
	"self initialize"
	
	Tasks := nil.
	self buildTaskList
]

{ #category : #'default maintenance tasks' }
WAGemStoneMaintenanceTask class >> maintenanceTaskExpiration [
	"self initialize"
	"self performTasks: 1"
	
	" run session expiration once each minute"
	
	^self 
		name: 'Seaside Session Expiration'
		frequency: 1
		valuable: [:task | | expired expirations transactionMode |
  			GsFile gciLogServer: 'Unregistering...', DateAndTime now printString.
			transactionMode := System transactionMode.
   			transactionMode ~~ #autoBegin ifTrue: [ System transactionMode: #autoBegin ].
  			expirations := task state.
  			System _sessionCacheStatAt: 5 put: expirations.
  			System _sessionCacheStatAt: 6 put: 0.
 			 expired := WABasicDevelopment reapSeasideCache.
  			expirations := expirations + 1.
			task state: expirations.
  			System _sessionCacheStatAt: 5 put: expirations.
  			System _sessionCacheStatAt: 6 put: expired.
  			expired > 0 ifTrue: [ (ObjectLogEntry trace: 'MTCE: expired sessions' object: expired) addToLog ].
  			GsFile gciLogServer: '...Expired: ', expired printString, ' sessions.'.
  			System commitTransaction.
  			System transactionMode: transactionMode ]
		reset: [:task | task state: 0 ]
]

{ #category : #'default maintenance tasks' }
WAGemStoneMaintenanceTask class >> maintenanceTaskMarkForCollect [
	"self initialize"
	"self performTasks: 60"
	
	" run session MFC once each hour"
	
	^self 
		name: 'Mark For Collect'
		frequency: 60
		valuable: [:task | 
			(System myUserProfile privileges includes: #GarbageCollection) 
				ifFalse: [ Transcript cr; show: 'Skipping markForCollect: ', DateAndTime now printString, '. Current user does not have GarbageCollection privileges.' ]
				ifTrue: [
			Transcript cr; show: 'Starting markForCollect.: ', DateAndTime now printString.
      		[ 	
				System transactionMode == #autoBegin 
					ifTrue: [ System abortTransaction ]
					ifFalse: [ System beginTransaction ].
				SystemRepository markForCollection ] 
			  on: Error, Warning
        		  do: [:ex |
					((ex isKindOf: Warning) or: [(ex gsNumber == 3020) or: [ex gsNumber == 3006]])
					  ifTrue: [ | fileSize freeSpace used fileUnit freeUnit usedUnit converter |
					    fileSize := SystemRepository fileSize / 1024.0.
					    freeSpace := SystemRepository freeSpace / 1024.0.
					    used := fileSize - freeSpace.
					    fileUnit := fileSize > (1024)
					      ifTrue: [
					        fileSize := fileSize / 1024.
					        'M']
					      ifFalse: ['K'].
					    freeUnit := freeSpace > (1024)
					      ifTrue: [
					        freeSpace := freeSpace / 1024.
					        'M']
					      ifFalse: ['K'].
					    usedUnit := used > (1024)
					      ifTrue: [
					        used := used / 1024.
					        'M']
					      ifFalse: ['K'].
					    System transactionMode ~~ #autoBegin ifTrue: [ System beginTransaction ].
					    converter := GRNumberPrinter new precision: 2.
					    (ObjectLogEntry
					      trace: 'MTCE: Repository Size'
					      object: 'Repository: ', (converter print: fileSize) , fileUnit,
										    ', Free: ', (converter print: freeSpace), freeUnit,
										    ', Used: ', (converter print: used), usedUnit) addToLog.
					    (ObjectLogEntry trace: 'MTCE: MFC' object: ex) addToLog.
					    System commitTransaction.
					    Transcript cr; show: ex description ]
					  ifFalse: [
						System transactionMode ~~ #autoBegin ifTrue: [ System beginTransaction ].
						(ObjectLogEntry trace: 'MTCE: MFC failure' object: ex) addToLog.
					    System commitTransaction.
					    Transcript cr; show: ex description ]].
			Transcript cr; show:  '...finished markForCollect.', DateAndTime now printString]]
]

{ #category : #'instance creation' }
WAGemStoneMaintenanceTask class >> name: aString frequency: aNumber valuable: aValuable [

	^self name: aString frequency: aNumber valuable: aValuable reset: [:task | ]
]

{ #category : #'instance creation' }
WAGemStoneMaintenanceTask class >> name: aString frequency: aNumber valuable: aValuable reset: resetBlock [

	^self new name: aString frequency: aNumber valuable: aValuable reset: resetBlock
]

{ #category : #operations }
WAGemStoneMaintenanceTask class >> performTasks: aCount [
	"
	 self performTasks: 0.
	 self performTasks: 1.
	 self performTasks: 60.
	"
	
	self tasks do: [:task | task performTask: aCount ]
]

{ #category : #operations }
WAGemStoneMaintenanceTask class >> removeTaskNamed: aString [

	| removals |
	removals := OrderedCollection new.
	self tasks do: [:task | task name = aString ifTrue: [ removals add: task ]].
	removals do: [: task | self tasks remove: task ].
]

{ #category : #operations }
WAGemStoneMaintenanceTask class >> resetTasks [
	"self resetTasks"
	
	self tasks do: [:task | task reset ]
]

{ #category : #operations }
WAGemStoneMaintenanceTask class >> taskNamed: aString [

	^ self taskNamed: aString ifAbsent: [ ^nil ]
]

{ #category : #operations }
WAGemStoneMaintenanceTask class >> taskNamed: aString ifAbsent: absentBlock [

	self tasks do: [:task | task name = aString ifTrue: [ ^task ]].
	^absentBlock value
]

{ #category : #accessing }
WAGemStoneMaintenanceTask class >> tasks [

	Tasks == nil ifTrue: [ Tasks := OrderedCollection new ].
	^Tasks
]

{ #category : #accessing }
WAGemStoneMaintenanceTask >> frequency [

   frequency == nil ifTrue: [ ^1 ].
   ^frequency
]

{ #category : #updating }
WAGemStoneMaintenanceTask >> frequency: newValue [

   frequency := newValue
]

{ #category : #accessing }
WAGemStoneMaintenanceTask >> name [

   ^name
]

{ #category : #updating }
WAGemStoneMaintenanceTask >> name: newValue [

   name := newValue
]

{ #category : #initialization }
WAGemStoneMaintenanceTask >> name: aString frequency: aNumber valuable: aValuable reset:aBlock [

	name := aString.
	frequency := aNumber.
	valuable := aValuable.
	resetBlock := aBlock.
	self reset.
]

{ #category : #execution }
WAGemStoneMaintenanceTask >> performTask: aCount [

	(aCount \\ self frequency) = 0
		ifTrue: [ self valuable value: self ].
]

{ #category : #Formatting }
WAGemStoneMaintenanceTask >> printOn: aStream [

aStream nextPutAll: self name
]

{ #category : #execution }
WAGemStoneMaintenanceTask >> reset [

	self resetBlock value: self
]

{ #category : #accessing }
WAGemStoneMaintenanceTask >> resetBlock [

   ^resetBlock
]

{ #category : #updating }
WAGemStoneMaintenanceTask >> resetBlock: newValue [

   resetBlock := newValue
]

{ #category : #accessing }
WAGemStoneMaintenanceTask >> state [

   ^state
]

{ #category : #updating }
WAGemStoneMaintenanceTask >> state: newValue [

   state := newValue
]

{ #category : #accessing }
WAGemStoneMaintenanceTask >> valuable [

   ^valuable
]

{ #category : #updating }
WAGemStoneMaintenanceTask >> valuable: newValue [

   valuable := newValue
]
