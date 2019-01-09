operations
vmStartup
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