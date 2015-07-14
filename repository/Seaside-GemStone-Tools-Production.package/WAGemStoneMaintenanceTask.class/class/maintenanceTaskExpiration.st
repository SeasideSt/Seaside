default maintenance tasks
maintenanceTaskExpiration
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