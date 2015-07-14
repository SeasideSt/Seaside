default maintenance tasks
maintenanceTaskMarkForCollect
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