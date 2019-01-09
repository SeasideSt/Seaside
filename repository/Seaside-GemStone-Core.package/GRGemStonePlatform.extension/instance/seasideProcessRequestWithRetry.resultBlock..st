*seaside-gemstone-core
seasideProcessRequestWithRetry: aNativeRequest resultBlock: resultBlock
  "answer nil to retry request"

  | result retryRequest retryException |
  self transactionMutex
    critical: [ 
      System inTransaction
        ifTrue: [ self doAbortTransaction ]
        ifFalse: [ self doBeginTransaction ].
      retryRequest := false.
      System _sessionCacheStatAt: 0 put: (System _sessionCacheStatAt: 0) + 1.	"requests received"
      [ result := resultBlock value: aNativeRequest ]
        on: WARetryHttpRequest , SafelyPerformBlockRequiringAbort
        do: [ :ex | 
          retryRequest := true.
          retryException := ex ].
	self transactionMutex privateLockingProcess: Processor activeProcess.
      retryRequest
        ifTrue: [ 
          (retryException isKindOf: SafelyPerformBlockRequiringAbort)
            ifTrue: [ 
              "Abort and start a transaction"
              self doBeginTransaction.
              retryException block value: true.	"block is expected to do it's own commit, but make sure we've left transaction mode"
              self doAbortTransaction ]
            ifFalse: [ 
              "lock not acquired - unwind the stack to this point and leave transaction mode"
              self doAbortTransaction	"self 
								saveLogEntry: (WAObjectLogEntry trace: retryException logMessage request: aNativeRequest object: retryException description) 
								shouldCommit: true" ].
          ^ nil	"retry request" ].
      self doCommitTransaction
        ifFalse: [ 
          | conflicts |
          conflicts := System transactionConflicts.
          self doAbortTransaction.
          self
            saveLogEntry:
              (WAObjectLogEntry
                warn: 'Commit failure - retrying'
                request: aNativeRequest url
                object: conflicts)
            shouldCommit: true.
          ^ nil	"retry request" ].
      System _sessionCacheStatAt: 1 put: (System _sessionCacheStatAt: 1) + 1	"requests processed (successful)" ].
  ^ result