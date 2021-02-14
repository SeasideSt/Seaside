Extension { #name : #GRGemStonePlatform }

{ #category : #'*seaside-gemstone-core' }
GRGemStonePlatform >> newReducedConflictCounter [
	
	^ RcCounter new
]

{ #category : #'*seaside-gemstone-core' }
GRGemStonePlatform >> newTransientValueHolder [

	^ TransientValue new
]

{ #category : #'*seaside-gemstone-core' }
GRGemStonePlatform >> retryDelays [

	^#(10 100 100 100 500 500 1000 1000 10000 10000)
]

{ #category : #'*seaside-gemstone-core' }
GRGemStonePlatform >> seasideLogServerStart: label port: port [

	self doTransaction: [
		(ObjectLogEntry
			info: label
			object:
				'pid: ', (System gemVersionReport at: 'processId') printString, ' ',
				'port: ', port printString) addToLog ]
]

{ #category : #'*seaside-gemstone-core' }
GRGemStonePlatform >> seasideProcessRequest: aNativeRequest adaptor: adaptor resultBlock: resultBlock [
	| result |
	[ 
	self retryDelays
		do: [ :retryDelay | 
			(result := self seasideProcessRequestWithRetry: aNativeRequest resultBlock: resultBlock) ~~ nil
				ifTrue: [ ^ result ].
			System _sessionCacheStatAt: 2 put: (System _sessionCacheStatAt: 2) + 1.	"requests retried"
			(Delay forMilliseconds: retryDelay) wait ].	
	"exceeded retry limit"
	^ adaptor internalServerErrorMessage: 'Too many retries: ' , (self retryDelays size + 1) printString ]
		on: Error
		do: [ :ex | 
			self doAbortTransaction.
			result := adaptor internalServerErrorMessage: ex description.	
			"Do an explicit return. Because of the abort above, the default action for an exception (resume) is set. see bug39246."
			ex return: nil ].
	^ result
]

{ #category : #'*seaside-gemstone-core' }
GRGemStonePlatform >> seasideProcessRequestWithRetry: aNativeRequest resultBlock: resultBlock [
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
]

{ #category : #'*seaside-gemstone-core' }
GRGemStonePlatform >> urlEncoderOn: aStream [

	^ WAGsUrlEncoder on: aStream
]

{ #category : #'*seaside-gemstone-core' }
GRGemStonePlatform >> urlEncoderOn: aStream codec: aCodec [

	^ aCodec url encoderFor: (WAGsUrlEncoder on: aStream)
]
